# Language Rhythm — Index (pointers, not rules)

This file states no rules of its own. Every rhythm rule lives in its language
catalog — the single source of truth. This index only collects one-line
characterizations plus exact section pointers, so a pass can find the right
section without opening all 20 files. **If this index and a catalog ever
disagree, the catalog wins — then fix this index.** The check scripts verify
every catalog is mentioned here (coverage, not content sync).

Read with `core-rules.md` §0, never at startup.

## The tensions to keep (do not flatten these)

- **tr** forbids fragments entirely; **uk** allows rhetorical staccato; **social**
  expects fragments. The same shape is a tell in one register and correct voice
  in another — the catalog row decides, never this index.
- **uk** dash is native (don't touch); **ru** dash is a hard ban; **hi** targets
  zero; **pl** defaults to the stricter no-dash rule pending native review.
- **fa** sends fragment runs back to complete sentences; core §0's merge rule
  agrees with it — merging is the fix, not the violation.

## Per-language pointers

- **en** — reference implementation: register table, opener row, false-positive
  list (singles tolerated, clusters flagged). `languages/en.md`
- **zh** — guided-tour openers banned; clipped negative fragments; one short
  forceful sentence OK, runs not; uneven length with asides. `languages/zh.md`
- **es** — colon budget ≤3–4 per whole text; burstiness targets (mean ~13–16
  words, real 3–5-word shorts); consequence gerunds → period; raya rules.
  `languages/es.md`
- **de** — burstiness as an explicit detector signal; rhythm variance; clustered
  colon-titles; clipped negation fragments banned ("nicht nur. sondern auch").
  `languages/de.md`
- **fr** — anaphoric rhythm-marketing (same opening formula repeated across
  sentences); opener row. `languages/fr.md`
- **ru** — information cardiogram (dense → light → dense); pro-drop; inversion
  welcome; uniform 15–20-word SVO clustering banned. `languages/ru.md`
- **ja** — honorific-register uniformity banned (vary levels; one plain-form
  punch sentence allowed). `languages/ja.md`
- **tr** — NO fragments (subject + predicate always); Phase 2 register-gated
  rhythm injection (variance, colloquial connectives, rhetorical questions,
  self-correction). `languages/tr.md`
- **ko** — left-branching relative-clause pileups unpacked, not nested further;
  summary openers; uniformity clustering. `languages/ko.md`
- **vi** — hollow tail clauses cut; mechanical dash rules. `languages/vi.md`
- **pl** — stricter no-dash default (pending native review); fragments
  embarrassing in published text. `languages/pl.md`
- **id** — filler openers; plain "adalah" over "merupakan"; multi-clause chains
  split; dash-as-clause banned. `languages/id.md`
- **uk** — dash native, touch only crutch-overuse and slogan antithesis;
  rhetorical staccato allowed; metronome rule; read-aloud check.
  `languages/uk.md`
- **ar** — word-order flexibility (VSO/SVO/fronting) as rotation; single-sentence
  paragraph outside technical register. `languages/ar.md`
- **pt** — 25-word max, varied naturally; never open a paragraph with a
  connective. `languages/pt.md`
- **it** — see "dispositio — how the piece is built" + "ornatus" (anti-AI
  patterns). `languages/it.md`
- **hi** — em dash foreign (target zero); register uniformity fails both ways;
  vary through sentence length. `languages/hi.md`
- **fa** — rhythm table (که-chains over three clauses → period; nested که split;
  fragment runs → complete sentence); dash note. `languages/fa.md`
- **nl** — see "Formality and register" + "Formatting and punctuation" (whole
  file provisional). `languages/nl.md`
- **th** — see "Politeness particles" + "Nominalization and structural calques"
  (whole file provisional). `languages/th.md`
