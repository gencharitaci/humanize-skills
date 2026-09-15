# Language: Polish (pl)

Pairs with `references/core-rules.md` and `references/structural-pass.md`. Synthesized
from two repos in `similar-github-projects/by-language/pl/`: a 44-pattern catalog
grounded in academic research on Polish LLM output (`humanizer-pl-1`, citing Mazur,
*LingVaria* 2024) and a bilingual PL/EN router with a distinct "naturalness" second
pass (`humanizer-pl-2`). Tier-2, wave 1.

## An open disagreement between the two sources — don't paper over it

The two sources give **opposite hard rules for the dash**. `humanizer-pl-1`, citing
PWN's own style authority, says Polish has two legitimate dash forms (pauza "—" and
półpauza "–"), both requiring spaces on either side, with only the choice-and-
consistency being the rule (pick one per document, never mix). `humanizer-pl-2` bans
both outright and mandates a plain ASCII hyphen everywhere. Until this is resolved by
native review, default to the stricter `humanizer-pl-2` rule (no em/en dash at all) for
general content, since it's the safer of the two failure directions — but apply
`humanizer-pl-1`'s PWN-sourced exception for genuine numeric ranges and dated spans
("1939–1945," "s. 12–18") in *either* mode, since both sources agree an en-dash is
correct there.

## Ethics gate and refusal route (specific to this source, worth keeping)

This skill's source explicitly refuses certain requests rather than completing them:
bypassing a detector, humanizing a specific academic submission to hide AI use where a
university's policy requires disclosure, writing fake testimonials or reviews meant to
impersonate real people, or hiding required sponsorship disclosure. This is a stronger,
more explicit version of `SKILL.md`'s own honest-framing fact-lock item — worth citing
directly rather than only implying, since Polish academic institutions (UW, SGH, UMCS,
UAM among others) specifically require AI-use declarations in thesis work.

## Mode gate (apply before any pattern work)

| Mode | When | What happens |
|---|---|---|
| Normal | Marketing, blog, social, newsletter, personal text | Full pattern removal plus voice, where the genre allows it |
| Cautious (default when unclear) | Text contains facts/numbers/quotes (case studies, reports), brand-voice business copy with no explicit "I" | Full style humanization, but never touch numbers, dates, quotes, or names; flag unverifiable claims rather than softening or inventing around them |
| Minimal | Contracts, regulations, official correspondence, technical specs/API docs | Only fix unambiguous AI tells (hallucinated abbreviation expansions, English calques, grammar errors, typography); never add casualness, humor, or personal voice; preserve legal modal verbs and impersonal register exactly |
| Refuse | Explicit request to defeat a detector or hide required AI-use disclosure | Decline the concealment request; offer to edit the author's own draft, or to help write a compliant AI-use declaration, instead |

## The over-timid failure mode (from humanizer-pl-2 — a real, documented finding)

A dedicated review found this skill's own early passes under-corrected: swapping
dashes and a handful of words while leaving 3–4 instances of "to nie X, to Y" in the
same piece. **A pattern that recurs is a tell precisely because it recurs** — count
occurrences, and if a diff is 80%+ punctuation and single-word swaps with no sentence-
structure change, that's a sign to go back and actually rewrite the weakest
paragraphs' structure, not just their punctuation. This is the Polish-specific version
of the general engine's change-magnitude self-check (`SKILL.md`), pointed at the
opposite failure direction: too little intervention, not too much.

## Content patterns

**"Today's world" openings**: "W dzisiejszym dynamicznie zmieniającym się świecie,"
"W dobie globalizacji," "Nie jest tajemnicą, że" — delete and open with the actual
content.

**Significance inflation**: stanowi świadectwo, odgrywa kluczową rolę, podkreśla wagę,
odzwierciedla szersze, wyznacza ton, zmienia zasady gry, gamechanger, rewolucjonizuje
branżę.

**Notability/media-presence padding**: niezależne relacje medialne, aktywna obecność w
mediach społecznościowych, listed without any actual quoted claim.

**Superficial participle-adverb tails**: podkreślając..., zapewniając...,
odzwierciedlając/symbolizując..., pielęgnując..., ucieleśniając... — the Polish version
of the English "-ing" padding tell.

**Promotional/advertising language**: tętniący życiem, bogaty (metaphorical), głęboki,
oszałamiający, must-see, wyjątkowy, niepowtarzalny — especially for places and
culture.

**Vague sourcing and hedging blur**: distinguish a vague *authority* ("eksperci
uważają," "obserwatorzy zauważają" — no one named) from a fabricated *specific*
("raport PKP z 2024," "prof. Kowalski" — invented). Never fabricate the specific; if
no real source exists, state the claim plainly as the writer's own or remove it.

**The formulaic "challenges and outlook" section**: pomimo industrialnego rozwoju...
mimo tych wyzwań... — replace with the actual, specific outcome.

## Hallucination — a distinct, high-priority category in Polish specifically

AI text in Polish is documented to invent **abbreviation expansions**: "PKP — Polska
Kolej Prywatna" (actually Polskie Koleje Państwowe), "GUS — Generalny Urząd
Statystyki" (actually Główny Urząd Statystyczny). Always verify a Polish institutional
abbreviation's expansion rather than trusting a generated one; this is a fact-lock
issue, not a style issue, and should be corrected against the real expansion, never
left as invented text. The same applies to invented names, dates, and unsourced
statistics ("Według badań 78% Polaków...") — flag for verification in cautious mode,
generalize or remove in normal mode, but never silently invent a citation to support
a number that was already in the draft.

## Language and grammar

**High-frequency AI vocabulary**: kluczowy, istotny, znaczący, przełomowy,
rewolucyjny, holistyczny, kompleksowy, dedykowany, fundamentalny, niezbędny, mozaika,
gobelin, wachlarz, podkreślać, uwidaczniać, stanowić, odzwierciedlać, świadectwo.

**Idiomatic English calques** — a large and distinctly Polish category, since these
translate an English idiom rather than an English word: "na koniec dnia" (at the end of
the day) → ostatecznie/w sumie; "drugi po nikim" (second to none) → bezkonkurencyjny;
"robić różnicę" (make a difference) → mieć znaczenie; "adresować problem" (address an
issue) → zająć się; "dostarczać wartość" (deliver value) → być wartościowy; "myśleć
poza pudełkiem" (think outside the box) → myśleć kreatywnie.

**Copula avoidance**: stanowić, może pochwalić się in place of być/mieć.

**Bureaucratic verbs, nominalization, and corporate jargon layered together**: należy
zwrócić uwagę, podejmować decyzję (instead of decydować), and imported corporate
buzzwords (synergia, workflow, eskalacja, touchpoint, onboarding) — especially
dangerous when it shows up in an instruction/how-to text that should read as direct
commands.

**Archaic-sounding stiff connectives**: albowiem/bowiem → bo; jednakże/aczkolwiek →
ale; wobec tego → więc; ponadto/co więcej → też/no i.

**Negative parallelism and the forced rule of three**, same shape as other languages.

**Documented grammar errors specific to Polish** (Mazur, *LingVaria* 2024 — composition
roughly 35% syntax, 24% lexical, 22% punctuation): case-agreement mismatch in a
predicate ("Jest to ważnym krokiem" instead of nominative "To ważny krok"); gender
agreement slips ("Lubię tę książka"); unusual collocations that don't actually occur in
natural Polish ("wykazywać silne emocje" instead of "okazywać emocje," "posiadać
wiedzę" instead of "mieć wiedzę"); undeclined proper nouns ("na ulicy Piłsudski"
instead of "Piłsudskiego"); and aspect confusion (perfective used for a habitual
action). Read sentences aloud; an odd-sounding collocation is worth a second look even
when grammatically well-formed.

## Register mixing — a distinct, high-priority tell in Polish

Two failure modes: (1) address drift — starting with formal Pan/Pani and sliding into
informal ty within the same piece; (2) register-level mixing — combining official
register ("uprzejmie informuję"), corporate jargon (synergia, touchpoint), colloquial
Polish (spoko, w sumie), and youth slang (essa, cringe) within a single passage. Pick
one register and hold it for the whole piece. **Exception, never touch**: legal-
register modal verbs in contracts and regulations ("zobowiązuje się" vs. "powinien"
carry different legal force — never substitute one for the other) and mandatory
official formulas ("niniejszym," "w nawiązaniu do") — these are not AI tells, they're
required legal register; apply Minimal mode here.

## Typography (see the disagreement note above before applying)

**Polish quotation marks**: „..." (low-opening, high-closing) is the norm; convert
straight `"..."` or English curly `"..."` on sight. A period or comma belongs *after*
the closing quotation mark in Polish, not before it (the opposite of AP/US style) —
this is subtle and worth a dedicated final search pass.

**Hidden Unicode artifacts**: non-breaking spaces, zero-width characters, a
typographic ellipsis "…" where three periods were intended, and a mathematical minus
sign "−" substituting for a hyphen — all worth a final scan.

**Diacritics**: ą, ć, ę, ł, ń, ó, ś, ź, ż must never be dropped.

**No unnecessary mid-sentence capitalization** ("Kluczowe Tematy" mid-sentence is an
English Title Case habit with no place in Polish).

## Chatbot residue and prompt-leakage (a documented real-world failure)

Beyond the ordinary chatbot residue list (Oczywiście!, Z pewnością!, Mam nadzieję że to
pomocne), Polish text specifically needs a check for **leaked English prompt/system
fragments** left in a published Polish text — a real, publicly embarrassing incident
occurred when a Polish politician's social media post contained unedited fragments
like "Sure, here is the article you requested:" or "[Twoje imię]" placeholders. Always
search the final text for English sentences embedded in Polish prose and for square-
bracket placeholders before delivering.

### Opener rotation and pre-flight carve-out

Conjunction openers: I, Ale, Lub, Więc, Jednak, Zatem. Pan/Pani-formal openers
kept verbatim in formal registers; irony-seasoned openers welcome informal.
Pre-flight carve-out: none confirmed — universal pre-flight applies; native
review may add one.

## Register table

| Register | New-fact tolerance | Register mixing tolerance | Dash | Personal voice |
|---|---|---|---|---|
| Contracts / official / technical (Minimal) | None | None — one fixed register | ASCII hyphen only | None |
| Business / cautious | None beyond restructuring | Low | ASCII hyphen only (see disagreement note) | Restrained, brand-voice "we," not personal "I" |
| Blog / personal / social (Normal) | Low-risk, flagged | None — pick one register | ASCII hyphen only | Full — "Moim zdaniem," "Uważam, że" fit here |

## Worked example

**Before:**
> W dzisiejszym dynamicznie zmieniającym się świecie automatyzacja stanowi kluczowy
> element sukcesu — jednakże wiele firm wciąż tego nie rozumie.

**After:**
> Coraz więcej firm automatyzuje powtarzalne procesy. Część wciąż tego nie robi, mimo
> że to prosta zmiana.

**Changes:** the "today's world" opening was cut; the copula avoidance ("stanowi") was
restored to a plain statement; the archaic connective ("jednakże") was replaced with
plain phrasing; the dash was removed per the stricter of the two sources' rules.

## Sources

`similar-github-projects/by-language/pl/humanizer-pl-1` — the 44-pattern catalog with
the mode gate, ethics/refusal system, hallucination section, and Mazur-2024-grounded
grammar-error list; `humanizer-pl-2` — the bilingual router with the "don't be timid"
finding and the Polish-naturalness second pass (parataxis-to-hypotaxis sentence
merging, calque-scan-by-test rather than by list). A third repo, `humanizer-pl-3`,
exists in the same folder for further cross-checking, and should also help resolve the
dash-typography disagreement above.
