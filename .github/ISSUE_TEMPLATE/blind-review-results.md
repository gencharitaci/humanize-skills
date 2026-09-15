---
name: Blind review results
about: Submit results from running the blind forced-choice check on one or more fixtures
title: "[blind-review] "
labels: ["fixture-review"]
---

<!--
Protocol: references/examples/README.md § "The blind forced-choice check".
The reviewer must NOT have written the fixture, and must see the two texts unlabelled
and in random order before choosing.
-->

**Fixture file(s):** <!-- e.g. examples/de-general.md -->

**Reviewer(s):** <!-- how many independent people, and roughly who — "3 people, native German speakers" / "2 people, fluent" -->

**Results** — one row per case per reviewer:

| Fixture | Case | Reviewer picked | Answer key expects | Match? | Note (why they picked it) |
|---|---|---|---|---|---|
| de-general | 1 | Input | Input | ✅ | "moreover-stacking gave it away" |
| de-general | 2 | Input | over-edited | ❌ | "the edited one read fine; the original had a weird dash" |

**Overall:** which cases pass (3/3 agree with key), which fail, and any pattern you noticed.

**Suggested fix** (optional): if a case failed, what would make the reference-after or
the over-edited foil clearly the machine-touched one?
