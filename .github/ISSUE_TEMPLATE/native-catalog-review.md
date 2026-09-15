---
name: Native catalog review
about: Native/near-native review of a language catalog and its fixtures
title: "[catalog-review] <language> — "
labels: ["catalog-review"]
---

**Language / file:** <!-- e.g. Vietnamese — references/languages/vi.md -->

**Your background with the language:** <!-- native / near-native / professional editor / etc. -->

---

### 1. Is the AI-slop input realistic?

For each fixture case (`examples/{code}-general.md`, and any `{code}-{mode}.md`): does
AI-generated text in this language actually read like the `Input`? What's off, if
anything — too exaggerated, not exaggerated enough, wrong kind of wrong?

### 2. Is the reference "after" something a real person would write?

Any residual tells? Anything that sounds translated rather than natively composed? A
better version is very welcome — paste it.

### 3. Are any rules wrong or missing in the catalog?

- **Wrong:** a banned word/construction that's actually normal native usage, or a
  threshold that's off.
- **Missing:** a real AI tell in this language the catalog doesn't mention.
- **Register:** does the register table match how the language actually works?

### 4. Anything else

Script/typography issues, RTL rendering (Arabic, Persian, Hindi), politeness systems,
dialect concerns, etc.

---

<!-- Concrete rule changes are even better as a PR against the catalog file with a
one-line note in references/examples/CHANGELOG.md. -->
