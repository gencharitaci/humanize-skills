# humanize-skills

An AI-writing-style skill that strips the clichés, filler phrases, and formulaic
structures catalogued in Wikipedia's "Signs of AI writing" guide — and the
discourse-level tells that survive a vocabulary edit — out of anything an AI
assistant drafts or edits.

- **Two passes.** A surface pass (vocabulary, sentence rhythm, formatting, chatbot
  residue) and a structural pass (stated morals, tidy single-track arcs, emotion
  named instead of shown, vague reference, shape convergence across a body of work).
- **20 languages**, each with its own pattern catalog and register table rather than
  a translated English word-list: English, Chinese, Spanish, German, French, Russian,
  Japanese, Turkish, Korean, Vietnamese, Polish, Indonesian, Ukrainian, Arabic,
  Portuguese, Italian, Hindi, Persian, Dutch, Thai.
- **10 purpose modes** layered on one core rulebook: `general` (default), `academic`,
  `medical`, `legal`, `business`, `resume`, `ux`, `creative`, `social`, `technical`.
- **Prompt-only.** No scanner script, no runtime dependencies — the whole engine is
  Markdown.

## Repo structure

```
humanize-skills/                          ← this repo
└── skills/
    └── humanize-skills/
        ├── SKILL.md                     ← router: reads flags, sets load order & precedence
        └── references/
            ├── core-rules.md            ← universal surface pass
            ├── structural-pass.md       ← the six discourse-level audits
            ├── voice-calibration.md     ← how to (and how not to) build a voice profile
            ├── languages/
            │   ├── en.md zh.md es.md de.md fr.md ru.md ja.md tr.md ko.md   (tier 1)
            │   ├── vi.md pl.md id.md uk.md ar.md pt.md it.md hi.md fa.md nl.md th.md  (tier 2)
            │   └── _template.md         ← contribution format for language #21+
            └── modes/
                └── general.md academic.md medical.md legal.md business.md
                    resume.md ux.md creative.md social.md technical.md
```

`SKILL.md` loads only the files a given request needs (core + structural + one
language + one mode), so the catalog scales by addition, not by growing a single file.
The `skills/<name>/SKILL.md` layout is the convention the `npx skills` installer
(see below) expects when it reads a repo's folder structure to find installable skills.

## How to use it

Once the skill is installed, you invoke it by **asking for it in a normal request** —
there is nothing to run on the command line. Any capable agent (Claude Code, Cursor,
Codex, …) picks the skill up automatically when a request looks like "make this sound
less like AI," "humanize this draft," "remove the em-dashes and filler," and so on.

The runtime flags below are **words you put in the request**, not shell arguments.
Combine any of them; leave them all out and the skill uses sensible defaults
(`--general` mode, language auto-detected from the text).

| Flag | What it does | Default if omitted |
|---|---|---|
| `--general` `--academic` `--medical` `--legal` `--business` `--resume` `--ux` `--creative` `--social` `--technical` | Purpose mode — sets what the pass preserves vs. strips | `--general`, or inferred from context (a pasted contract ⇒ `--legal`) |
| `--lang=xx` | Force a language catalog (`en`, `zh`, `es`, `de`, `fr`, `ru`, `ja`, `tr`, `ko`, `vi`, `pl`, `id`, `uk`, `ar`, `pt`, `it`, `hi`, `fa`, `nl`, `th`) | Detected from the input text |
| `--audit` | Diagnose only — grouped by severity (CRITICAL/HIGH/MEDIUM/LOW), **no rewrite** | Off (the skill rewrites and reports) |
| `--strict` / `--light` | Force a deeper or lighter pass | Self-assessed from how AI-sounding the input is |
| `--free` / `--careful` / `--minimal` | How much the text may shrink (delete filler vs. hold 80–110% vs. unambiguous tells only) | `--free` for passages, `--careful` for documents |
| `--write` | Draft new text under the rules instead of cleaning up existing text | Off (rewrite mode) |
| `--tone=xx` | Relational coloring: `expert` / `biz` / `human` / `social` / `landing` / `article` / `case` (mode caps win conflicts) | `human` (`expert` for legal/medical) |
| `--calibrate` | Match the requester's own voice — supply 3–5 real writing samples | Off (edits toward a neutral human baseline) |
| `--redo` | Run a second pass on the skill's own previous output; can be scoped ("just the second paragraph") | Off |

Every request opens with a **pre-flight check**: short inputs (<~100 words) skip
scoring; otherwise the skill scores AI-pattern signals 0–100 and STOPs with a
diagnostic only when the text already reads human (weighted guard, per-language
carve-outs in `SKILL.md`). Say "rewrite regardless" to force a minimal pass.

**Example requests**

```
humanize this, --academic --lang=de
```
```
--audit this blog post — I want to see what's flagged before deciding
```
```
tighten my cover letter so it sounds like me, --resume --calibrate
[paste 3–5 things you've written]
```
```
soften the error messages in this file, --ux --light
```

Nothing is required. "Make this read less like ChatGPT" on its own runs the general
mode in whatever language you wrote. `SKILL.md`'s frontmatter carries the same flag
list for the agent's benefit.

### Whole files and long documents

Hand it a file path or paste something long (roughly 1,500+ words, or anything with
titled sections) and it switches to **Document mode**:

- **Audits first** — a findings list (`pattern → section → severity`), no rewrite,
  until you say "apply the fixes".
- **Freezes the structure** — headings, section order, tables, figures, equations,
  code, footnotes, and every citation stay exactly as they are; only prose is touched.
- **Skips clean sections** — the no-edit gate runs per section.
- **Returns changed spans only** — `before → after` for each edited passage plus a
  short per-section summary, never the whole regenerated document in the reply.
- **Writes back in the same format** — `paper.md` → `paper.humanized.md`,
  `thesis.tex` → `thesis.humanized.tex` (LaTeX/math/`\cite{}` preserved); the original
  is never overwritten. Formats it can't rebuild faithfully (`.docx`, `.pdf`, …) get
  the span list to apply in your own editor.

**One thing the install cannot do:** scope itself to a subset of modes or languages.
The whole engine installs every time (it's a few hundred KB of Markdown), and
`SKILL.md` loads only the handful of files a given request needs. There is no
`npx skills add … --modes=…` or `--langs=…` — the community `npx skills` CLI does not
forward custom flags to a skill, and the design doesn't need it.

---

## Install with `npx skills` (recommended — works across 30+ coding agents)

`npx skills` is a third-party, community-maintained CLI (the `skills` package on npm,
ecosystem led by `vercel-labs/skills`) — not an Anthropic product. It reads a public
GitHub repo, finds `SKILL.md` files in it, and copies or symlinks them into whichever
agents it detects on your machine (Claude Code, Cursor, opencode, Codex, Kiro, and
others). No npm publishing step is needed on your end; it works directly against the repo.

> **Status:** not yet published. The commands below use the intended repo path
> `gencharitaci/humanize-skills`; they start working once the repo is pushed public.

### 1. Push this repo to GitHub
```bash
git init
git add .
git commit -m "Add humanize-skills"
git remote add origin https://github.com/gencharitaci/humanize-skills.git
git branch -M main
git push -u origin main
```
The repo must be **public** — `npx skills` reads it over plain HTTPS by default.

### 2. Install it
```bash
npx skills add gencharitaci/humanize-skills
```
This lists the one skill it finds (`humanize-skills`) and asks which agent(s) to
install it for. For a non-interactive install:
```bash
npx skills add gencharitaci/humanize-skills --skill humanize-skills -a claude-code -y
```
Useful variations:
```bash
# Preview what's in the repo without installing anything
npx skills add gencharitaci/humanize-skills --list

# Install globally (all your projects) instead of just the current one
npx skills add gencharitaci/humanize-skills --skill humanize-skills -g -y

# Install for every agent npx skills detects on your machine
npx skills add gencharitaci/humanize-skills --skill humanize-skills -a '*' -y
```
`npx skills` symlinks by default so updates are live; on Windows, where symlinks
need elevated permissions, add `--copy` and re-run `npx skills update` after a change.
The whole skill is Markdown — `references/` comes along with `SKILL.md` automatically.

### 3. Verify, update, or remove
```bash
npx skills list                          # confirm it installed
npx skills update                        # pull the latest version from your repo
npx skills remove humanize-skills        # uninstall (add -g if it was installed globally)
```

### 4. Manual paths — when npx isn't an option

`npx skills` above writes into these same directories automatically. Copy the
`skills/humanize-skills/` folder by hand only if the CLI doesn't cover your
setup. Project paths are relative to your repo root; global paths are home-dir.

| Agent | Project path | Global path |
|---|---|---|
| Claude Code | `.claude/skills/humanize-skills/` | `~/.claude/skills/humanize-skills/` |
| Codex CLI | `.codex/skills/humanize-skills/` | `~/.codex/skills/humanize-skills/` |
| Cursor | `.cursor/skills/humanize-skills/` | `~/.cursor/skills/humanize-skills/` |
| opencode | `.opencode/skills/humanize-skills/` | `~/.config/opencode/skills/humanize-skills/` |
| Kilo Code | `.kilocode/skills/humanize-skills/` | `~/.kilocode/skills/humanize-skills/` |
| Gemini CLI | `.gemini/skills/humanize-skills/` | `~/.gemini/skills/humanize-skills/` |
| Shared fallback (Amp, Roo, Copilot, others) | `.agents/skills/humanize-skills/` | `~/.agents/skills/humanize-skills/` |

```bash
# Example: opencode, project-local
cp -r skills/humanize-skills .opencode/skills/humanize-skills
# Example: Kilo Code, global (PowerShell)
Copy-Item -Recurse skills/humanize-skills ~/.kilocode/skills/humanize-skills
```

opencode also reads the Claude-compatible (`.claude/skills/`) and
agent-compatible (`.agents/skills/`) paths, and Cursor reads both of those too —
one copy in either location serves both agents on the same machine. The skill's
frontmatter uses only the shared core fields (`name`, `description`, `license`)
that every agent reads; unknown fields are ignored, so no per-agent variant is
needed. Verify with the agent's own skill list (Claude Code: `/skills`;
opencode: the `skill` tool; Cursor: **Customize → Skills**), then invoke it in
plain words — "humanize this, --academic" works identically everywhere.

---

## Alternative: install directly in Claude (no npx, no GitHub needed)

If you don't want to publish a repo, you can hand the skill to Claude directly.

### Claude.ai, Claude Desktop, or Cowork
1. Zip only the inner `humanize-skills/` folder (the one containing `SKILL.md`
   directly — **not** the outer `skills/` wrapper folder), so `references/` stays
   alongside `SKILL.md` inside the zip:
   ```bash
   cd skills && zip -r humanize-skills.zip humanize-skills
   ```
2. In the app: **Settings → Customize → Skills → + → + Create skill** → upload that ZIP.
3. Confirm the toggle is on. *Team/Enterprise:* an org owner can instead provision it
   for everyone from **Organization settings → Skills**; either way, **Code execution
   and file creation** and **Skills** must be enabled first.

### Claude Code (manual, no npx)
```bash
cp -r skills/humanize-skills ~/.claude/skills/humanize-skills      # personal, all projects
# or
cp -r skills/humanize-skills .claude/skills/humanize-skills        # this project only
```
Verify with `/skills` inside a session, or `claude --list-skills`.

### Claude API
Pass it via `container.skills` on the Messages API (requires the Code Execution Tool
beta) — see Anthropic's "Using Agent Skills with the API" documentation for the
current request shape. Upload `SKILL.md` and the whole `references/` tree together.

---

## Using it with ChatGPT, Gemini, or any other assistant

These tools don't read the `SKILL.md` folder format, and this skill is a router
rather than one self-contained prompt — so assemble the pieces the request needs and
paste them into the tool's persistent-instructions field (ChatGPT Custom Instructions
or a Project's instructions, a Gemini Gem's instructions, or any system-prompt
equivalent):

1. `skills/humanize-skills/SKILL.md` — the body below the frontmatter (the no-edit
   gate, load order, precedence, fact-lock).
2. `references/core-rules.md` and `references/structural-pass.md` — always.
3. `references/languages/<your-language>.md` — the catalog for the language you're
   writing in.
4. `references/modes/<your-mode>.md` — `general.md` if you're not sure.
5. Only if you want voice matching: `references/voice-calibration.md`.

Concatenated, that's a few pages — well within a custom-instructions field. Skip the
language file only if no dedicated one exists yet for your language; in that case say
so to the tool and let it apply `core-rules.md` alone rather than improvising.

---

## One honest note

This skill removes patterns that make writing feel formulaic, and that incidentally
makes it less likely to trip pattern-based AI detectors — because that's literally
what the rules strip out. It's not a guarantee against detection, since detectors are
unreliable in both directions, and it doesn't change whether disclosure is owed in a
given context. If you're using it somewhere that requires disclosing AI assistance — a
school policy, a publication's rules, Wikipedia's own ban on undisclosed LLM-written
content — following a style guide doesn't satisfy that requirement. It only makes the
prose better.

---

## Contributing

The two highest-value contributions are **native-speaker review of the language
catalogs** and **running the blind forced-choice check on the golden fixtures**. See
[`CONTRIBUTING.md`](CONTRIBUTING.md). The `references/examples/` fixtures are currently
model-authored and unreviewed — regression tripwires, not a validated gold standard.

## License

CC BY 4.0 (Creative Commons Attribution 4.0 International) — see
[`LICENSE.md`](LICENSE.md). © Adem Kurtipek. Free to share and adapt, including
commercially, with attribution.
