# Fixture lint + mirror sync check (PowerShell).
#
# Dev hygiene only — lives at repo root so it NEVER ships with `npx skills`
# installs (only skills/humanize-skills/ installs). Run from github-repo/:
#   powershell -File scripts/check.ps1
# Exit code 0 = clean, 1 = problems found.

$ErrorActionPreference = 'Stop'
$fail = 0

function Fail($msg) { Write-Output "FAIL: $msg"; $script:fail = 1 }

# --- 1. Mirror sync: canonical vs github-repo mirror vs claude-upload mirror ---
# (Run from a checkout that has the full humanize-skills/ layout.)
$root = Split-Path $PSScriptRoot -Parent          # github-repo/
$project = Split-Path $root -Parent               # humanize-skills/
$canonical = Join-Path $project 'skills\humanize-skills'
$claude = Join-Path $project 'claude-upload\humanize-skills'
$mirror = Join-Path $root 'skills\humanize-skills'

foreach ($pair in @(@($canonical, $mirror, 'github-repo'), @($canonical, $claude, 'claude-upload'))) {
    $src, $dst, $label = $pair
    if (-not (Test-Path $src)) { Fail "canonical dir missing: $src"; continue }
    if (-not (Test-Path $dst)) { Fail "mirror dir missing: $dst"; continue }
    foreach ($f in Get-ChildItem $src -Recurse -File) {
        $rel = $f.FullName.Substring($src.Length)
        $other = Join-Path $dst ($rel.TrimStart('\', '/'))
        if (-not (Test-Path $other)) { Fail "[$label] missing file: $rel"; continue }
        if ((Get-FileHash $f.FullName).Hash -ne (Get-FileHash $other).Hash) {
            Fail "[$label] content differs: $rel"
        }
    }
}
Write-Output 'mirror check done.'

# --- 2. Fixture lint ---
$examples = Join-Path $mirror 'references\examples'
$skip = @('README.md', 'CHANGELOG.md', 'BLIND-RESULTS.md')
$required = @('**Setup:**', '**Input:**', '**Expected decisions:**', '**Reference "after":**',
              '**Blind forced-choice answer key:**', '**A regression here looks like:**')
$count = 0
foreach ($f in Get-ChildItem $examples -File -Filter '*.md') {
    if ($skip -contains $f.Name) { continue }
    $count++
    $text = Get-Content $f.FullName -Raw
    if ($text -notmatch 'model-authored, unreviewed') {
        Fail "$($f.Name): missing unreviewed status banner"
    }
    foreach ($section in $required) {
        if ($text -notmatch [regex]::Escape($section)) {
            Fail "$($f.Name): missing section $section"
        }
    }
    if ($text -match 'No-edit gate:\s*\*\*triggered') {
        if ($text -notmatch 'over-edited version') {
            Fail "$($f.Name): no-edit case without over-edited foil"
        }
    }
    if ($text -cmatch 'TODO|FIXME|XXX') {
        Write-Output "NOTE: $($f.Name) contains a TODO marker (check if intentional)"
    }
}
Write-Output "linted $count fixture files."

# --- 3. Agent Skills spec validation (mirrors skills-ref validate) ---
$skillFile = Join-Path $mirror 'SKILL.md'
$raw = Get-Content $skillFile -Raw
if ($raw -notmatch '(?s)\A---\s*\r?\n(.*?)\r?\n---\s*\r?\n') {
    Fail 'SKILL.md: missing YAML frontmatter block'
} else {
    $front = $Matches[1]
    $fields = @{}
    foreach ($line in ($front -split '\r?\n')) {
        if ($line -match '^([A-Za-z-]+):\s*(.*)$') { $fields[$line.Trim()] = $true; $fields[$Matches[1]] = $Matches[2] }
    }
    $name = ($fields['name'] | Out-String).Trim()
    if ($name -ne 'humanize-skills') { Fail "frontmatter name '$name' must match directory 'humanize-skills'" }
    if ($name -notmatch '^[a-z0-9]+(-[a-z0-9]+)*$' -or $name.Length -gt 64) { Fail 'name must be 1-64 chars: lowercase alnum + hyphens, no leading/trailing/double hyphen' }
    $desc = ''
    if ($raw -match '(?m)^description:\s*>-\s*\r?\n((?:  .*(?:\r?\n|$))+)') {
        $desc = ($Matches[1] -replace '(?m)^  ', '' -replace '\s+', ' ').Trim()
    } elseif ($front -match '(?m)^description:\s*(.+)$') { $desc = $Matches[1].Trim() }
    if ($desc.Length -lt 1 -or $desc.Length -gt 1024) { Fail "description parsed length $($desc.Length), must be 1-1024" }
    if ($desc -match '<[^>]+>') { Fail 'description must not contain XML tags' }
    foreach ($key in @($fields.Keys | Where-Object { $_ -notmatch ' ' })) {
        if ($key -notin @('name', 'description', 'license', 'compatibility', 'metadata', 'allowed-tools')) {
            Fail "unrecognized frontmatter field '$key' (spec allows name/description/license/compatibility/metadata/allowed-tools)"
        }
    }
    $bodyLines = (($raw -split '\r?\n').Count) - (($front -split '\r?\n').Count) - 2
    if ($bodyLines -ge 500) { Fail "SKILL.md body $bodyLines lines, keep under 500 (move detail to references/)" }
    Write-Output "spec check done (name ok, description $($desc.Length)/1024, body $bodyLines lines)."
}

# --- 4. Reference + flag integrity ---
# Scoping (each exemption is load-bearing, not laziness):
# - _legacy-calibration.md is a retired frozen record; its old-structure paths stay.
# - Lines mentioning similar-github-projects/ document EXTERNAL repo layouts
#   (e.g. de.md cites humanizer-de's own references/patterns.md) — not our tree.
# - references/voice-profile.md is a documented future path: created only when a
#   user requests cross-session persistence (voice-calibration.md), never shipped.
$allow = @('references/voice-profile.md')
$mdFiles = Get-ChildItem $mirror -Recurse -File -Filter '*.md' | Where-Object { $_.Name -ne '_legacy-calibration.md' }
foreach ($f in $mdFiles) {
    $dir = Split-Path $f.FullName -Parent
    $lines = Get-Content $f.FullName
    # Skip whole paragraphs (blank-line blocks) that document external repo layouts:
    # the similar-github-projects/ mention often sits a line above its paths.
    $skip = @{}
    $cur = New-Object System.Collections.ArrayList
    for ($i = 0; $i -le $lines.Count; $i++) {
        $isEnd = ($i -eq $lines.Count) -or ($lines[$i] -match '^\s*$')
        if ($isEnd) {
            if ((($cur | ForEach-Object { $lines[$_] }) -join "`n") -match 'similar-github-projects') {
                foreach ($n in $cur) { $skip[$n] = $true }
            }
            $cur = New-Object System.Collections.ArrayList
        } else { [void]$cur.Add($i) }
    }
    for ($i = 0; $i -lt $lines.Count; $i++) {
        if ($skip.ContainsKey($i)) { continue }
        $ln = $i + 1
        $line = $lines[$i]
        foreach ($pat in @('references/[A-Za-z0-9_./-]+\.md', '\b(modes|tones|examples)/[A-Za-z0-9_.-]+\.md')) {
            foreach ($m in [regex]::Matches($line, $pat)) {
                $rel = $m.Value
                if ($allow -contains $rel) { continue }
                $target = if ($rel.StartsWith('references/')) { Join-Path $mirror ($rel -replace '/', '\') }
                          else { Join-Path $mirror (Join-Path 'references' ($rel -replace '/', '\')) }
                if (-not (Test-Path $target)) { Fail "$($f.Name):$ln broken link $rel" }
            }
        }
    }
}
$card = Join-Path $mirror 'references\language-rhythm.md'
if (-not (Test-Path $card)) { Fail 'references/language-rhythm.md missing' }
else {
    $cardText = Get-Content $card -Raw
    foreach ($l in Get-ChildItem (Join-Path $mirror 'references\languages') -File -Filter '*.md') {
        if ($l.Name -in @('_template.md', '_legacy-calibration.md')) { continue }
        if ($cardText -notmatch [regex]::Escape('`languages/' + $l.Name + '`')) {
            Fail "language-rhythm.md: no pointer row for $($l.Name)"
        }
    }
    Write-Output 'card coverage check done.'
}
$body = $raw.Substring($raw.IndexOf("`n---", $raw.IndexOf('description:')) + 4)
$stems = { param($t) [regex]::Matches($t, '--([a-z]+)') | ForEach-Object { $_.Groups[1].Value } | Select-Object -Unique }
$descFlags = &$stems $desc
$bodyFlags = &$stems $body
foreach ($fl in $descFlags) { if ($bodyFlags -notcontains $fl) { Fail "flag --$fl in description but no --$fl* in SKILL body" } }
Write-Output "integrity check done ($($mdFiles.Count) files scanned, $($descFlags.Count) description flag stems covered)."

if ($fail -eq 0) { Write-Output 'OK: all checks passed.' } else { Write-Output 'CHECKS FAILED — see FAIL lines above.' }
exit $fail
