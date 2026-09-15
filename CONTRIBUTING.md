# Contributing to humanize-skills

This skill is prompt-only Markdown — no build, no dependencies. The two things it most
needs from contributors are **native-speaker review of the language catalogs** and
**running the blind forced-choice check on the golden fixtures**. Both are described
below. Ordinary fixes (a wrong rule, a typo, a better example) are welcome as normal PRs.

## Repo layout

```
skills/humanize-skills/
├── SKILL.md                       router
└── references/
    ├── core-rules.md              universal surface pass
    ├── structural-pass.md         discourse-level checks
    ├── voice-calibration.md
    ├── languages/{code}.md        20 language catalogs + _template.md
    ├── modes/{mode}.md            10 purpose modes
    └── examples/                  golden fixtures + the blind-check protocol
        ├── README.md              ← read this before touching fixtures
        ├── CHANGELOG.md
        └── BLIND-RESULTS.md       ← where blind-pass outcomes are recorded
```

## 1. Native-speaker review of a language catalog (highest-value)

Every non-English catalog was written by a model from source repos (or, for `nl.md`
and `th.md`, from cross-linguistic inference with **no source repo at all**). None has
been checked by a native speaker. If you're a native or near-native writer of one of
the 20 languages:

1. Read `references/languages/{your-code}.md` and its two fixtures in
   `references/examples/{code}-general.md` (and any `{code}-{mode}.md`).
2. Open an issue using the **"Native catalog review"** template. The three questions
   that matter most:
   - Is the **AI-slop input** in each fixture realistic — does AI-generated text in
     this language actually read like that?
   - Is the **reference "after"** something a real person would write, with no
     residual tells and nothing that sounds translated?
   - Are any **rules wrong or missing** — a banned construction that's actually fine,
     or a real tell the catalog doesn't mention?
3. Concrete rule changes are best as a PR against the catalog file, with a one-line
   note in `references/examples/CHANGELOG.md` under `### Fixed` or `### Changed`.

Priority order for languages that need this most: **Dutch, Thai** (no source repo),
then the other nine tier-2 languages (`vi pl id uk ar pt it hi fa`), then tier-1.

**Worked-example note:** each catalog's "Worked example" `**After:**` was reviewed and,
where it invented a plausible result to look concrete (`en fr ja fa hi th nl es`),
rewritten to *remove the inflation and flag the gap* — matching the fact-lock ("never
invent an example"). Native review of the language in those rewrites is still wanted,
and if you think a "keep what the draft had, flag the rest" example reads worse than a
clearly-marked placeholder one, say so.

## 2. Run the blind forced-choice check on the fixtures

The full protocol is in `references/examples/README.md` § "The blind forced-choice
check". Short version:

1. Pick a fixture file. For each numbered case it has two texts — the `Input` and
   either the `Reference "after"` (normal case) or the `Deliberately over-edited
   version` (no-edit case).
2. Get **someone who did not write the fixture** to look at the two texts as "A" and
   "B" in random order, with no labels, and answer one question: *"Which of these two
   was touched by an automated writing tool?"*
3. Compare their pick to the fixture's **Blind forced-choice answer key**.
4. Record the result in `references/examples/BLIND-RESULTS.md` (one row per case per
   reviewer) using the format in that file. A case **passes** only with 3 independent
   reviewers agreeing with the key.
5. If reviewers pick against the key, that's the finding — note *why* they picked what
   they did. A normal case failing usually means the reference-after still has a tell
   or the edit injected a new one; a no-edit case failing means the skill's edit would
   damage genuine human prose.

You do not need to be a contributor to submit results — open an issue with the
**"Blind review results"** template and paste your rows.

## 3. Adding or changing a rule

- Keep the register-gating: a tell in one genre is often correct prose in another.
  Rules go in a table or are tagged with which register they apply to.
- Never add a rule that tells the model to *invent* anything. The fact-lock in
  `SKILL.md` is absolute.
- If a rule change would alter what an existing fixture's "Expected decisions" say,
  that's a **MAJOR** change per `references/examples/README.md` — call it out, update
  the fixture, and re-run its blind check.

## 4. Adding a language

Copy `references/languages/_template.md` to `{code}.md` and fill it. Ground every rule
in real observation of how AI text in that language reads wrong — not a translation of
`en.md`'s list. Cite your sources. Add a `{code}-general` fixture with one AI-slop case
and one no-edit case (see any existing one as a model).

## Scope — what this skill is not

A prose-quality tool, not a detector-evasion or disclosure-avoidance product. PRs that
frame the goal as "beat AI detectors" or "hide required AI-use disclosure" will be
declined. See the "honest framing" note in `SKILL.md` and `README.md`.

## 5. Publishing (maintainer checklist)

- [ ] `powershell -File scripts/check.ps1` green (mirrors in sync, all fixtures
  lint clean, frontmatter spec-valid).
- [ ] Install-test on 2–3 real agents **including one non-Claude agent**
  (opencode or Kilo Code) **and** the Windows `--copy` path — the symlink
  default needs elevated permissions on Windows.
- [ ] Push `gencharitaci/humanize-skills` public (HTTPS-readable; that is all
  `npx skills` needs). License is `LICENSE.md` (CC BY 4.0, © Adem Kurtipek) —
  no swap needed.
- [ ] Repo settings: description, topics (`skills`, `ai-writing`, `humanizer`,
  plus `agent-skills`), CC-BY-4.0 license detected.
- [ ] Tag `0.1.0` only after the first blind forced-choice pass completes
  (see `references/examples/BLIND-RESULTS.md`) — not before.
- [ ] Deliberately **not** shipping: install-time `--modes`/`--langs` scoping
  (the CLI doesn't forward custom flags), per-agent router variants (one
  universal skill — frontmatter stays on the shared core fields), and
  `commands/` slash shortcuts (no `commands/` concept in the Agent Skills spec;
  Claude-only extras would break the works-everywhere claim).
