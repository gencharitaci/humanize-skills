# humanize-skills

![humanize-skills — KI-Spuren in 20 Sprachen × 10 Modi × 7 Tönen entfernen](assets/banner.svg)

Ein KI-Schreibstil-Skill, der Klischees, Füllphrasen und formelhafte Strukturen
aus Wikipedias Leitfaden „Signs of AI writing" — sowie die Diskurseigenheiten,
die eine Vokabeleditierung überleben — aus allem entfernt, was ein KI-Assistent
entwirft oder bearbeitet.

- **Zwei Durchgänge.** Ein Oberflächendurchgang (Wortschatz, Satzrhythmus,
  Formatierung, Chatbot-Rückstände) und ein Strukturdurchgang (ausgesprochene
  Moralen, aufgeräumte Einbahn-Arcs, benannte statt gezeigte Emotion, vage
  Referenzen, Formkonvergenz über ein Textkorpus).
- **20 Sprachen**, jede mit eigenem Musterkatalog und eigener Registertabelle
  statt einer übersetzten englischen Wortliste: Englisch, Chinesisch, Spanisch,
  Deutsch, Französisch, Russisch, Japanisch, Türkisch, Koreanisch, Vietnamesisch,
  Polnisch, Indonesisch, Ukrainisch, Arabisch, Portugiesisch, Italienisch, Hindi,
  Persisch, Niederländisch, Thailändisch.
- **10 Zweckmodi** auf einem Kernregelwerk: `general` (Standard), `academic`,
  `medical`, `legal`, `business`, `resume`, `ux`, `creative`, `social`,
  `technical`.
- **Nur Prompts.** Kein Scanner-Skript, keine Laufzeitabhängigkeiten — die ganze
  Engine ist Markdown.

*Diese Datei ist die deutsche Übersetzung der englischen `README.md`. Bei
Abweichungen gilt die englische Fassung.*

*Sprachen: [English](README.md) · [Türkçe](README.tr.md) · [Español](README.es.md) · [Deutsch](README.de.md) · [中文](README.zh.md) · [العربية](README.ar.md) · [Français](README.fr.md)*

## Repo-Struktur

```
humanize-skills/                          ← dieses Repo
└── skills/
    └── humanize-skills/
        ├── SKILL.md                     ← Router: liest Flags, setzt Ladereihenfolge & Vorrang
        └── references/
            ├── core-rules.md            ← universeller Oberflächendurchgang
            ├── structural-pass.md       ← die sechs Diskurs-Audits
            ├── voice-calibration.md     ← Stimmprofil aufbauen (und wie nicht)
            ├── languages/
            │   ├── en.md zh.md es.md de.md fr.md ru.md ja.md tr.md ko.md   (Stufe 1)
            │   ├── vi.md pl.md id.md uk.md ar.md pt.md it.md hi.md fa.md nl.md th.md  (Stufe 2)
            │   └── _template.md         ← Beitragsformat für Sprache Nr. 21+
            └── modes/
                └── general.md academic.md medical.md legal.md business.md
                    resume.md ux.md creative.md social.md technical.md
```

`SKILL.md` lädt nur die Dateien, die eine Anfrage braucht (Kern + Struktur +
eine Sprache + ein Modus); der Katalog wächst durch Hinzufügen, nicht durch
Aufblähen einer Datei. Das Layout `skills/<Name>/SKILL.md` ist die Konvention,
die der Installer `npx skills` (s. u.) erwartet, um installierbare Skills zu finden.

## Benutzung

Nach der Installation rufst du den Skill **in einer normalen Anfrage auf** — es
gibt nichts auf der Kommandozeile auszuführen. Jeder fähige Agent (Claude Code,
Cursor, Codex, …) greift ihn automatisch auf, wenn eine Anfrage nach „weniger
nach KI klingen", „humanize this draft", „Em-Dashes und Füller entfernen" o. Ä.
aussieht.

Die Laufzeit-Flags unten sind **Wörter in der Anfrage**, keine Shell-Argumente.
Kombinierbar; ohne Flags gelten sinnvolle Defaults (`--general`, Sprache aus dem
Text erkannt).

| Flag | Wirkung | Default wenn weggelassen |
|---|---|---|
| `--general` `--academic` `--medical` `--legal` `--business` `--resume` `--ux` `--creative` `--social` `--technical` | Zweckmodus — legt fest, was bleibt vs. wegkommt | `--general`, oder aus Kontext erschlossen (eingefügter Vertrag ⇒ `--legal`) |
| `--lang=xx` | Sprachkatalog erzwingen (`en`, `zh`, `es`, `de`, `fr`, `ru`, `ja`, `tr`, `ko`, `vi`, `pl`, `id`, `uk`, `ar`, `pt`, `it`, `hi`, `fa`, `nl`, `th`) | Aus dem Eingabetext erkannt |
| `--audit` | Nur Diagnose — nach Schwere gruppiert (CRITICAL/HIGH/MEDIUM/LOW), **kein Rewrite** | Aus (der Skill schreibt um und berichtet) |
| `--strict` / `--light` | Tieferen oder leichteren Durchgang erzwingen | Selbsteinschätzung nach KI-Anmutung des Inputs |
| `--free` / `--careful` / `--minimal` | Wie stark schrumpfen darf (Filler löschen vs. 80–110% halten vs. nur eindeutige Tells) | `--free` für Passagen, `--careful` für Dokumente |
| `--write` | Neuen Text unter den Regeln entwerfen statt vorhandenen zu säubern | Aus (Rewrite-Modus) |
| `--tone=xx` | Beziehungsebene: `expert` / `biz` / `human` / `social` / `landing` / `article` / `case` (Modus-Caps gewinnen) | `human` (`expert` für legal/medical) |
| `--calibrate` | Eigene Stimme matchen — 3–5 echte Schreibproben beilegen | Aus (neutrale menschliche Basis) |
| `--redo` | Zweiten Durchgang über die vorige Ausgabe; eingrenzbar ("nur Absatz 2") | Aus |

Jede Anfrage beginnt mit einem **Pre-Flight-Check**: kurze Inputs (<~100 Wörter)
überspringen das Scoring; sonst bewertet der Skill KI-Mustersignale 0–100 und
STOPPT mit reiner Diagnose, wenn der Text bereits menschlich liest (gewichteter
Guard, sprachspezifische Ausnahmen in `SKILL.md`). „Trotzdem umschreiben" erzwingt
einen minimalen Durchgang.

**Beispielanfragen**

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

Nichts ist Pflicht. „Make this read less like ChatGPT" allein fährt den
General-Modus in deiner Sprache. Das Frontmatter von `SKILL.md` trägt dieselbe
Flagliste für den Agenten.

### Ganze Dateien und lange Dokumente

Dateipfad übergeben oder etwas Langes einfügen (ca. 1.500+ Wörter, oder mit
Titelabschnitten) → **Dokumentmodus**:

- **Erst auditieren** — Befundliste (`Muster → Abschnitt → Schwere`), kein
  Rewrite, bis du „apply the fixes" sagst.
- **Struktur einfrieren** — Headings, Reihenfolge, Tabellen, Abbildungen,
  Gleichungen, Code, Fußnoten und jede Zitierung bleiben exakt; nur Prosa wird
  angefasst.
- **Saubere Abschnitte überspringen** — No-Edit-Gate läuft pro Abschnitt.
- **Nur geänderte Spannen zurückgeben** — `before → after` je Passage plus kurze
  Abschnittsbilanz, niemals das regenerierte Gesamtdokument in der Antwort.
- **Im Quellformat zurückschreiben** — `paper.md` → `paper.humanized.md`,
  `thesis.tex` → `thesis.humanized.tex` (LaTeX/Math/`\cite{}` erhalten); das
  Original wird nie überschrieben. Formate ohne treue Rekonstruktion (`.docx`,
  `.pdf`, …) bekommen die Spannenliste für den eigenen Editor.

**Eines kann die Installation nicht:** sich auf Modi- oder Sprachen-Teilmengen
beschränken. Die Engine installiert sich immer ganz (wenige hundert KB Markdown),
und `SKILL.md` lädt nur die Handvoll Dateien pro Anfrage. Kein `npx skills add …
--modes=…`/`--langs=…` — die Community-CLI leitet keine Custom-Flags an Skills
weiter, und das Design braucht es nicht.

---

## Installieren mit `npx skills` (empfohlen — läuft auf 30+ Coding-Agenten)

`npx skills` ist eine Community-CLI (npm-Paket `skills`, Ökosystem um
`vercel-labs/skills`) — kein Anthropic-Produkt. Sie liest ein öffentliches
GitHub-Repo, findet `SKILL.md`-Dateien und kopiert oder verlinkt sie in die
erkannten Agenten (Claude Code, Cursor, opencode, Codex, Kiro u. a.). Kein
npm-Publish nötig; arbeitet direkt gegen das Repo.

> **Stand:** noch nicht publiziert. Die Befehle nutzen den Zielpfad
> `gencharitaci/humanize-skills`; sie greifen, sobald das Repo public ist.

### 1. Repo nach GitHub pushen
```bash
git init
git add .
git commit -m "Add humanize-skills"
git remote add origin https://github.com/gencharitaci/humanize-skills.git
git branch -M main
git push -u origin main
```
Das Repo muss **public** sein — `npx skills` liest per plain HTTPS.

### 2. Installieren
```bash
npx skills add gencharitaci/humanize-skills
```
Listet den einen gefundenen Skill (`humanize-skills`) und fragt nach dem/den
Agenten. Nicht-interaktiv:
```bash
npx skills add gencharitaci/humanize-skills --skill humanize-skills -a claude-code -y
```
Nützliche Varianten:
```bash
# Vorschau ohne Installation
npx skills add gencharitaci/humanize-skills --list

# Global statt nur projektlokal
npx skills add gencharitaci/humanize-skills --skill humanize-skills -g -y

# Für jeden erkannten Agenten
npx skills add gencharitaci/humanize-skills --skill humanize-skills -a '*' -y
```
`npx skills` symlinked defaultmäßig (Updates live); auf Windows (Symlinks brauchen
erhöhte Rechte) `--copy` anhängen und nach Änderungen `npx skills update`
wiederholen. Der Skill ist reines Markdown — `references/` kommt automatisch mit.

### 3. Prüfen, updaten, entfernen
```bash
npx skills list                          # Installation bestätigen
npx skills update                        # neueste Version aus deinem Repo ziehen
npx skills remove humanize-skills        # deinstallieren (global: -g dazu)
```

### 4. Manuelle Pfade — ohne npx

`npx skills` schreibt automatisch in dieselben Verzeichnisse. Nur bei Bedarf den
Ordner `skills/humanize-skills/` von Hand kopieren. Projektpfade relativ zum
Repo-Root; globale zum Home-Verzeichnis.

| Agent | Projektpfad | Globaler Pfad |
|---|---|---|
| Claude Code | `.claude/skills/humanize-skills/` | `~/.claude/skills/humanize-skills/` |
| Codex CLI | `.codex/skills/humanize-skills/` | `~/.codex/skills/humanize-skills/` |
| Cursor | `.cursor/skills/humanize-skills/` | `~/.cursor/skills/humanize-skills/` |
| opencode | `.opencode/skills/humanize-skills/` | `~/.config/opencode/skills/humanize-skills/` |
| Kilo Code | `.kilocode/skills/humanize-skills/` | `~/.kilocode/skills/humanize-skills/` |
| Gemini CLI | `.gemini/skills/humanize-skills/` | `~/.gemini/skills/humanize-skills/` |
| Gemeinsamer Fallback (Amp, Roo, Copilot, andere) | `.agents/skills/humanize-skills/` | `~/.agents/skills/humanize-skills/` |

```bash
# Beispiel: opencode, projektlokal
cp -r skills/humanize-skills .opencode/skills/humanize-skills
# Beispiel: Kilo Code, global (PowerShell)
Copy-Item -Recurse skills/humanize-skills ~/.kilocode/skills/humanize-skills
```

opencode liest auch die Claude-kompatiblen (`.claude/skills/`) und
Agenten-kompatiblen (`.agents/skills/`) Pfade, Cursor beide ebenfalls — eine
Kopie an einer Stelle bedient beide Agenten. Das Frontmatter nutzt nur die
geteilten Kernfelder (`name`, `description`, `license`); unbekannte Felder werden
ignoriert, keine Agenten-Varianten nötig. Mit der Skill-Liste des Agenten prüfen
(Claude Code: `/skills`; opencode: das `skill`-Tool; Cursor: **Customize →
Skills**), dann in normalen Worten aufrufen — "humanize this, --academic"
funktioniert überall gleich.

---

## Alternative: direkt in Claude installieren (ohne npx, ohne GitHub)

Ohne Repo-Publikation den Skill direkt übergeben.

### Claude.ai, Claude Desktop oder Cowork
1. Nur den inneren Ordner `humanize-skills/` zippen (der `SKILL.md` direkt
   enthält — **nicht** den äußeren Wrapper `skills/`), damit `references/`
   neben `SKILL.md` im Zip bleibt:
    ```bash
    cd skills && zip -r humanize-skills.zip humanize-skills
    ```
2. In der App: **Settings → Customize → Skills → + → + Create skill** → ZIP hochladen.
3. Toggle prüfen. *Team/Enterprise:* Owner kann stattdessen über
   **Organization settings → Skills** für alle provisionieren; in beiden Fällen
   zuerst **Code execution and file creation** und **Skills** aktivieren.

### Claude Code (manuell, ohne npx)
```bash
cp -r skills/humanize-skills ~/.claude/skills/humanize-skills      # persönlich, alle Projekte
# oder
cp -r skills/humanize-skills .claude/skills/humanize-skills        # nur dieses Projekt
```
Per `/skills` in einer Session prüfen, oder `claude --list-skills`.

### Claude API
Über `container.skills` in der Messages API (braucht Code-Execution-Tool-Beta) —
aktuellen Request-Shape in Anthropics Doku „Using Agent Skills with the API".
`SKILL.md` plus den ganzen `references/`-Baum zusammen hochladen.

---

## Nutzung mit ChatGPT, Gemini oder anderen Assistenten

Diese Tools lesen das Ordnerformat nicht; der Skill ist ein Router, kein
eigenständiger Prompt — also die benötigten Teile zusammensetzen und ins
Persistenz-Feld kleben (ChatGPT Custom Instructions/Projekt-Anweisungen, Gemini
Gem-Anweisungen o. Ä.):

1. `skills/humanize-skills/SKILL.md` — der Body unter dem Frontmatter (No-Edit-
   Gate, Ladereihenfolge, Vorrang, Fact-Lock).
2. `references/core-rules.md` und `references/structural-pass.md` — immer.
3. `references/languages/<deine-sprache>.md` — der Katalog deiner Sprache.
4. `references/modes/<dein-modus>.md` — `general.md` bei Unsicherheit.
5. Nur bei Voice-Matching: `references/voice-calibration.md`.

Aneinandergehängt wenige Seiten — passt in jedes Custom-Instructions-Feld. Die
Sprachdatei nur weglassen, wenn es für deine Sprache noch keine gibt; dann dem
Tool sagen und `core-rules.md` allein wirken lassen statt improvisieren.

---

## Eine ehrliche Anmerkung

Der Skill entfernt Muster, die Schreiben formelhaft wirken lassen — und senkt
nebenbei die Trefferquote musterbasierter KI-Detektoren, weil genau das die
entfernten Regeln sind. Keine Erkennungs-Garantie: Detektoren sind in beide
Richtungen unzuverlässig, und ob eine Offenlegungspflicht besteht, ändert das
nicht. Wo KI-Nutzung offengelegt werden muss — Schulregeln, Publikationsregeln,
Wikipedias Verbot undeklarierter LLM-Inhalte — erfüllt ein Styleguide diese
Pflicht nicht. Er macht nur die Prosa besser.

---

## Beitragen

Die zwei wertvollsten Beiträge: **Muttersprachler-Review der Sprachkataloge**
und der **blinde Forced-Choice-Check der Golden Fixtures**. Siehe
[`CONTRIBUTING.md`](CONTRIBUTING.md). Die Fixtures in `references/examples/`
sind derzeit modell-erstellt und ungeprüft — Regressions-Tripwires, kein
validierter Goldstandard.

## Lizenz

CC BY 4.0 (Creative Commons Attribution 4.0 International) — siehe
[`LICENSE.md`](LICENSE.md). © Adem Kurtipek. Frei zum Teilen und Anpassen,
auch kommerziell, mit Namensnennung.
