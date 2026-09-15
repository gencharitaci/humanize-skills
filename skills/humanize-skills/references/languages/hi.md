# Language: Hindi (hi)

Pairs with `references/core-rules.md` and `references/structural-pass.md`. Synthesized
from `similar-github-projects/by-language/hi/humanizer-hi-1` ("human-writer-hi"), a
Devanagari-specific satellite of a larger multi-language family. Tier-2, wave 2. Only
one dedicated skill repo exists for Hindi in the whole survey (the other candidate
found, `bhasha-seo`, is a JS web app rather than an agent skill) — treat this file as a
strong starting point pending a second source to cross-check against, and **script/
Devanagari-rendering handling still needs separate verification** beyond the pattern
content covered here.

## Two mechanical tells unique to Devanagari script

- **The danda "।" versus a Latin period "."** — outside casual chat/messaging
  register, a Devanagari sentence ending in a Latin period rather than the danda is a
  mechanical tell worth fixing on sight, not just on clustering.
- **The em dash "—" is foreign to Devanagari.** Target zero instances in Hindi prose;
  convert to a comma, colon, danda, or parentheses instead. This is a harder line than
  most other languages here draw on em dashes — treat any instance as worth fixing,
  not just a cluster.

## Register uniformity — both directions are tells

Two opposite failure modes, and **either one alone is a register tell**: an
over-Sanskritized register (तथा/एवं/अतः/तदनुसार used constantly) for what should be a
casual audience, or thin, decorative Hinglish code-mixing dropped into what should be a
formal piece. Neither extreme is wrong on its own — a formal document should be
Sanskritized, a casual post can code-mix — the tell is mismatching the register to the
audience, or drifting between the two within one piece.

## Vocabulary and constructions to flag

**Suspect vocabulary**: यह ध्यान देने योग्य है, गौरतलब है कि, आज के युग में, निःसंदेह,
मजबूत (as a translation of "robust"), क्रांतिकारी, अत्याधुनिक, क्षमता को अनलॉक करें,
गहराई में उतरें, आइए जानें.

**AI-signature constructions**: "यह न केवल X है, बल्कि Y भी" (not only X but also Y);
"चाहे आप X हों या Y" (whether you're X or Y); "कल्पना कीजिए एक ऐसी दुनिया की" (imagine a
world where).

**EN→hi calques specific to translated copy**: निर्बाध (seamless), कार्रवाई योग्य
अंतर्दृष्टि (actionable insight), महत्वपूर्ण भूमिका निभाता है (plays an important role),
गेम-चेंजर (game-changer) — these read as translated rather than natively composed.

**Conclusion templates**: अंत में, अंततः, निष्कर्ष में, संक्षेप में, कुल मिलाकर opening a
closing paragraph — the Hindi version of the generic-conclusion tell found across
every language file here.

## Structural and formatting patterns

**The bullet "…है" trap**: a list where every item starts with the same word or ends
with the same verb form. Vary the opening and the verb across list items, or convert
to connected prose.

**Tricolon overuse**: "X, Y और Z" / "X, Y तथा Z" / "X, Y एवं Z" appearing more than once
per 200 words — the Hindi version of the rule-of-three tell.

**Header pyramids**: an H2 systematically followed by exactly three H3s, repeated
across a document — a mechanical outline shape rather than one that reflects actual
content structure.

**Chained figures of speech**: two rhetorical figures in one sentence, or two
consecutive sentences each carrying one (metaphor, antithesis, anaphora, rhetorical
question, ellipsis-for-effect). Human writers — technical authors especially — don't
stack devices this densely. The default sentence skeleton should be a plain subject-
verb-complement declarative; vary through sentence length, not through piling
rhetorical devices on top of each other.

**Digit and honorific consistency**: mixing Latin numerals ("2026") and Devanagari
numerals ("२०२६") within one register is a tell, as is inconsistent honorific register
(आप/तुम) within a single piece — pick one and hold it.

## Fact-lock, Hindi-specific

**Invented factual claims** (launch dates, prices, proof points, differentiators) in
new-content mode: use a placeholder or an explicitly marked assumption, never invent —
this is the Hindi-specific instance of the engine-wide fact-lock in `SKILL.md`.

**Substitutable content** — a piece a direct competitor could publish unchanged with
no edits — is flagged as its own content-level defect, distinct from any surface-level
tell and invisible to any mechanical scan. Worth checking at the content level, not
just the sentence level, particularly for marketing and short-form copy.

## Risk scoring bands (from the source, useful as a general severity frame)

The source uses a four-band scheme worth adopting as a general severity vocabulary for
Hindi specifically: LOW_RISK, MEDIUM_RISK, HIGH_RISK, CRITICAL. On a MEDIUM finding,
apply the top few highest-impact fixes and reassess rather than rewriting everything;
on a HIGH/CRITICAL finding in edited (not newly drafted) text, apply a stronger
rewrite strategy rather than a light touch.

### Opener rotation and pre-flight carve-out

Conjunction openers: लेकिन, और, इसलिए, हालांकि. Urban English code-switching
in openers is natural register, not a tell — do not sterilize it. आप-respectful
default holds unless the genre says otherwise. Pre-flight carve-out: none
confirmed; script/layout handling still unverified — pattern rows only.

## Worked example

**Before:**
> आज के युग में डिजिटल परिवर्तन न केवल व्यवसायों के लिए आवश्यक है, बल्कि यह भी एक
> क्रांतिकारी अवसर है। यह न केवल दक्षता बढ़ाता है, बल्कि यह भी लागत कम करता है। अंत में,
> यह अत्याधुनिक समाधान हर कंपनी की क्षमता को अनलॉक कर सकता है।

**After:**
> डिजिटल टूल अपनाने से टीम के काम करने का तरीका बदलता है, पर हर कंपनी में एक जैसा असर
> नहीं करता। मूल में "दक्षता बढ़ती है", "लागत कम होती है" जैसे दावे हैं पर कोई आंकड़ा नहीं,
> बाहरी सामग्री में डालने से पहले असली आंकड़े चाहिए। यहाँ कोई नहीं गढ़ा गया।

**Changes:** the generic opening ("आज के युग में"), the negative-parallelism
construction ("न केवल... बल्कि यह भी..." used twice), the suspect vocabulary
("क्रांतिकारी," "अत्याधुनिक," "क्षमता को अनलॉक करें"), and the conclusion template ("अंत
में") were all removed. The draft states no measurable result, so the missing numbers
are flagged rather than filled — an earlier version of this example invented
"तीन दिन से घटकर चार घंटे", which the fact-lock forbids. No em dash and no Latin
period are used in the rewrite, per the two Devanagari rules above.

## Sources

`similar-github-projects/by-language/hi/humanizer-hi-1` — part of a "human-writer"
family covering English, French, Spanish, Portuguese, German, and Arabic as sibling
satellites, each specialized per language from a shared master doctrine; the Hindi
satellite is this file's sole source and would benefit from a second independent
repo for cross-checking, per the roadmap's native-verification risk note.
