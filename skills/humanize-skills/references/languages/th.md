# Language: Thai (th)

Pairs with `references/core-rules.md` and `references/structural-pass.md`. Tier-2,
wave 2.

## Honest framing — read this before trusting anything below

**No dedicated Thai humanizer repo exists anywhere in the survey**, checked across
all three of the field's naming vocabularies — confirmed as a genuine zero alongside
Dutch, and arguably the riskier of the two to extrapolate for, since Thai is
typologically far more distant from the English-centric source material the rest of
this engine's cross-linguistic patterns were drawn from (no verb conjugation, no
plural marking, an analytic classifier system, sentence-final politeness particles
with no equivalent in any other language covered here, and a writing system with no
inter-word spacing). **Treat this file as a lower-confidence hypothesis than `nl.md`**
— Dutch at least shares deep structural common ground with the other European
languages already validated here; Thai does not, so more of what follows is inference
from Thai's own grammar rather than pattern-transfer from a sibling language. This
file has not been checked against a real corpus of Thai AI text or reviewed by a
native speaker. Do not present its claims with the same confidence as a
source-grounded language file, and prioritize native review here above `nl.md` if
only one can be done first.

## Politeness particles (ครับ/ค่ะ) — plausibly the single highest-value check

Thai marks politeness and speaker gender through sentence-final particles (ครับ for a
male speaker, ค่ะ/คะ for a female speaker, and their variants) rather than through
vocabulary choice the way English does. Two opposite failure modes are both
plausible AI tells: **mechanical over-application** — a particle glued onto every
single sentence regardless of whether a native speaker would actually pause there —
and **total absence** in a register where a real person would use them (customer
messages, casual-but-polite writing, spoken-style content). Native Thai varies
particle placement and frequency by rhythm and relationship to the listener; a fixed,
metronomic pattern in either direction (always present, or never present) is worth a
second look. This is inference from how the particle system works, not a measured
finding — verify against real examples before treating it as established.

## Nominalization and structural calques from English (extrapolated, unvalidated)

**"เป็นสิ่งที่" as a copula-avoidance crutch** — roughly "is a thing that," used where
a direct verb or adjective would read more naturally; plausibly the Thai shape of the
copula-avoidance tell documented in several other languages in this catalog (Spanish,
Indonesian, Ukrainian), but unconfirmed for Thai specifically.

**"ไม่เพียงแต่...แต่ยัง..." (not only... but also...)** — a likely direct calque of
the English negative-parallelism construction; Thai natively tends to coordinate
ideas more simply (with และ, or by simple juxtaposition) rather than reaching for
this contrastive frame. A single instance may be unremarkable; repeated use across a
text is the more plausible tell.

**Passive "ถูก" overuse**: ถูก + verb (ถูกทำ, ถูกสร้าง) is grammatically standard but
carries a mildly negative or victim-of-action connotation in native use (ถูกตี "got
hit," ถูกไล่ออก "got fired") — its use as a neutral, English-style passive marker
across many sentences in a row is plausibly a translation-register tell, since native
Thai prefers topic-comment structure or an active construction with the agent
named or dropped. Unconfirmed as a measured finding.

**Pronoun over-insertion**: Thai is a strongly pro-drop language — omitting the
subject when it's recoverable from context is the default, unmarked, natural
construction, not an error. AI output translated from or composed under English
influence plausibly over-inserts ผม/ฉัน/ดิฉัน/เรา where a native writer would drop the
pronoun entirely. This is the reverse of most tells in this engine (most languages
flag missing-agent constructions; Thai's likely failure mode runs the other way) —
worth stating explicitly so it isn't miscorrected using another language's rule.

## Vocabulary and phrasing (extrapolated from cross-linguistic patterns)

**Empty time-framing**: ในโลกปัจจุบัน (in today's world), ในยุคดิจิทัล (in the digital
age), ในปัจจุบันนี้มากกว่าที่เคย (today more than ever) — the same shape documented
independently across nearly every other language here.

**Throat-clearing openers**: สิ่งสำคัญคือ (the important thing is), ควรทราบว่า
(should be noted that), ต้องยอมรับว่า (it must be admitted that) — likely cuttable
without loss.

**Overused connectors**: กล่าวคือ (that is to say), ดังนั้น (therefore), อย่างไรก็ตาม
(however) — plausible tells only in density; any one of these is entirely normal
written Thai on its own, unlike some of the more marked constructions above.

**Vague attribution**: ผู้เชี่ยวชาญกล่าวว่า (experts say), จากการศึกษาพบว่า (studies
have found) with no source named — replace with a real citation or drop the claim.

**Generic conclusions**: โดยสรุป (in summary), กล่าวโดยสรุป (to summarize) opening a
closing paragraph with nothing new in it.

## Formatting

Markdown-style bullet lists, bold labels, and header hierarchies are foreign to
traditional Thai prose rhythm, which relies on connective particles and clause
chaining rather than visual chunking — plausibly a tell in casual or narrative
register specifically, though normal and expected in genuinely reference-style
content (documentation, specs). Thai traditionally has no hard sentence-final
punctuation mark equivalent to a period; a space (or no mark at all) traditionally
signals a clause or sentence boundary, though contemporary digital Thai increasingly
borrows the period from English-influenced typing. Treat an unusually heavy, rigid
period-per-sentence discipline in informal registers as a possible (not certain)
translation-register signal rather than a confirmed one.

## What NOT to flag

Pronoun-dropping — this is the default, correct, native construction, not an error
to fix by inserting a pronoun; a single politeness particle used naturally; ถูก used
in its ordinary negative/passive sense (ถูกไล่ออก, ถูกตี); formal or reference
register in genuinely formal or reference content (legal text, documentation,
government communication).

### Opener rotation and pre-flight carve-out (provisional — whole file unvalidated)

Conjunction openers: แต่, และ, ดังนั้น, อย่างไรก็ตาม. Polite particles
(ครับ/ค่ะ) in formal openers are mandatory, not decoration — a missing particle
fails before any rhythm question arises. Blunt king-report-style directness in
soft contexts banned. Pre-flight carve-out: none confirmed; native review may
add (or correct) any row here.

## Worked example (illustrative only — untested against real Thai AI output)

**Before:**
> ในยุคดิจิทัล การเปลี่ยนแปลงทางเทคโนโลยีเป็นสิ่งที่สำคัญมากสำหรับทุกธุรกิจ ไม่เพียงแต่
> ช่วยเพิ่มประสิทธิภาพ แต่ยังช่วยลดต้นทุนอีกด้วย โดยสรุป ธุรกิจที่ไม่ปรับตัวจะถูกทิ้งไว้
> ข้างหลัง

**After:**
> การเปลี่ยนมาใช้เครื่องมือดิจิทัลทำให้วิธีทำงานของทีมเปลี่ยนไป แต่ผลลัพธ์ไม่เหมือนกันในทุก
> บริษัท
> (ต้นฉบับบอกว่า "เพิ่มประสิทธิภาพ" และ "ลดต้นทุน" แต่ไม่มีตัวเลข ถ้าจะใช้กับงานเผยแพร่ต้องมี
> ตัวเลขจริง ที่นี่ไม่ได้แต่งขึ้น)

**Changes:** the empty time-framing opener, the copula-avoidance construction
("เป็นสิ่งที่สำคัญ"), the negative-parallelism sentence, and the generic warning
conclusion ("โดยสรุป...จะถูกทิ้งไว้ข้างหลัง") were removed. The draft states no
measurable result, so the missing numbers are flagged rather than filled — an earlier
version of this example invented "สเปรดชีตห้าไฟล์" and "ครึ่งวันต่อสัปดาห์", which the
fact-lock forbids.

## Sources

None. No dedicated Thai humanizer repo was found under any of the three naming
vocabularies searched. This file draws on general typological knowledge of Thai
grammar and on cross-linguistic patterns documented elsewhere in this engine, with
the deliberate caveat that Thai's typological distance from those other
languages makes pattern-transfer less reliable here than for `nl.md`. This is the
lowest-confidence file in the catalog and the top candidate for replacement should a
real Thai-specific source repo or native reviewer become available.
