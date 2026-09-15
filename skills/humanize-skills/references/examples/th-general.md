# th-general — golden fixtures

> **Status: model-authored, unreviewed — AND the underlying catalog is itself
> unvalidated, and lower-confidence than every other file.** `th.md` has **no source
> repo**, and Thai is typologically far from the material the engine's cross-linguistic
> patterns came from (no verb conjugation, pro-drop, classifiers, sentence-final
> particles, no inter-word spacing). This fixture is a hypothesis about a
> lower-confidence hypothesis. Regression tripwire only — see `README.md` › Validation
> status. Native review here is the **top priority** in the whole suite.

`--general`, Thai. Extrapolated tells: `เป็นสิ่งที่` copula-avoidance, `ไม่เพียงแต่…
แต่ยัง…` (English negative-parallelism calque), `ถูก` passive overuse, **pronoun
over-insertion** (Thai is pro-drop — this is the reverse of most tells here), empty
time-framing, `โดยสรุป` conclusions.

---

## Case 1 — time-framed, pronoun-heavy explanatory paragraph, edit warranted

**Setup:** "ช่วยเขียนใหม่ให้ดูไม่เหมือน AI เขียน --general" Register: semi-formal blog.

**Input:**
> ในยุคดิจิทัล การเปลี่ยนแปลงทางเทคโนโลยีเป็นสิ่งที่สำคัญมากสำหรับทุกธุรกิจ มันไม่เพียงแต่
> ช่วยเพิ่มประสิทธิภาพ แต่ยังช่วยลดต้นทุนอีกด้วย จากการศึกษาพบว่าองค์กรที่ปรับตัวจะประสบ
> ความสำเร็จมากกว่า เราเชื่อว่าเราสามารถช่วยให้ธุรกิจของคุณเติบโตได้ โดยสรุป ธุรกิจที่ไม่
> ปรับตัวจะถูกทิ้งไว้ข้างหลัง

**Expected decisions:**
- "ในยุคดิจิทัล" — empty time-framing, `th.md`. Cut.
- "เป็นสิ่งที่สำคัญมาก" — `เป็นสิ่งที่` copula-avoidance crutch, `th.md`. Use a direct
  adjective/verb.
- "มันไม่เพียงแต่ X แต่ยัง Y อีกด้วย" — negative-parallelism calque + "มัน" as an
  inanimate pronoun subject (pronoun over-insertion), `th.md`. State directly; drop "มัน".
- "จากการศึกษาพบว่า" — vague attribution, `th.md`. Name a study or cut the claim.
- "เราเชื่อว่าเราสามารถ…" — pronoun over-insertion ("เรา" twice in one clause where Thai
  drops it), `th.md`. Also promotional.
- "โดยสรุป, …จะถูกทิ้งไว้ข้างหลัง" — generic conclusion (`th.md`) + "ถูก"-passive with a
  faintly victim connotation used as a neutral English-style passive, `th.md`.
- Fact-lock: no study, no numbers → flag, don't invent.
- Change magnitude: ~60% (eyeballed). No-edit gate: passed.

**Reference "after":**
> การเปลี่ยนมาใช้เครื่องมือดิจิทัลทำให้วิธีทำงานของทีมเปลี่ยนไป แต่ผลลัพธ์ไม่เหมือนกันในทุก
> บริษัท ต้นฉบับบอกว่า "เพิ่มประสิทธิภาพ" และ "ลดต้นทุน" แต่ไม่มีตัวเลข ถ้าจะใช้กับงานเผยแพร่
> ต้องมีตัวเลขจริง ที่นี่ไม่ได้แต่งขึ้น และตัด "จากการศึกษาพบว่า" ออกเพราะไม่มีแหล่งอ้างอิง

**Blind forced-choice answer key:** a judge picks the **Input** — "ในยุคดิจิทัล",
"เป็นสิ่งที่สำคัญ", "มันไม่เพียงแต่ … แต่ยัง … อีกด้วย", "จากการศึกษาพบว่า",
"เราเชื่อว่าเรา…", "โดยสรุป", "จะถูกทิ้งไว้ข้างหลัง" — a stack of the extrapolated tells.
The reference-after drops the pronouns, admits a scope limit, and flags the missing
numbers rather than inventing a before/after.

**A regression here looks like:** "เป็นสิ่งที่" survives; "ไม่เพียงแต่…แต่ยัง…" stays;
pronouns "มัน" / doubled "เรา" are kept where Thai would drop them; "จากการศึกษาพบว่า"
gets a fabricated study; a concrete result ("five spreadsheets", "three days to four
hours") gets invented; or the close is still "โดยสรุป … จะถูกทิ้งไว้ข้างหลัง".

---

## Case 2 — already-human casual post, NO EDIT (pro-drop, natural particles)

**Setup:** "ช่วยเกลาโพสต์นี้หน่อย --general"

**Input:**
> อาทิตย์ที่แล้วย้ายระบบ build ไปตัวใหม่ ใช้เวลาครึ่งวัน export โอเค แต่ import ช้ามาก
> repo สองร้อยกว่าตัวใช้เวลาเกือบสามชั่วโมง น่าจะทำตั้งนานแล้ว ขี้เกียจเอง มี runner ตัว
> นึงยังค้างอยู่ ยังไม่รู้ว่าทำไม

**Expected decisions:**
- **Pro-drop throughout** — no subject pronoun anywhere ("ย้ายระบบ…", "ใช้เวลา…",
  "ยังไม่รู้ว่าทำไม"). `th.md`: this is the default, correct, native construction —
  **do not insert ผม/ฉัน/เรา**. "what NOT to flag": pronoun-dropping.
- No sentence-final politeness particle (ครับ/ค่ะ) — appropriate for a casual written
  post to no specific reader; `th.md` warns against **mechanically adding** a particle
  to every sentence. Do not add them.
- Naturalized loanwords (build/export/import/repo/runner) in a casual post — fine.
- Concrete detail (อาทิตย์ที่แล้ว, ครึ่งวัน, สองร้อยกว่าตัว, เกือบสามชั่วโมง). A
  self-aware aside ("ขี้เกียจเอง"). An open question at the end.
- No time-framing, no "เป็นสิ่งที่", no negative parallelism, no vague attribution, no
  "โดยสรุป".
- No-edit gate: **triggered.** Correct output is no change.
- Change magnitude: 0%.

**Deliberately over-edited version (for the blind pair):**
> เมื่อสัปดาห์ที่ผ่านมา ผมได้ทำการย้ายระบบ build ไปยังเครื่องมือใหม่ครับ ซึ่งผมใช้เวลา
> ประมาณครึ่งวัน การ export เป็นไปด้วยดีครับ ในขณะที่การ import นั้นค่อนข้างช้า โดย
> repository จำนวนกว่าสองร้อยตัวถูกย้ายภายในเวลาเกือบสามชั่วโมงครับ ผมควรจะทำสิ่งนี้ตั้งแต่
> เนิ่น ๆ ครับ นอกจากนี้ ยังมี runner อีกหนึ่งตัวที่ยังคงค้างอยู่ และผมยังไม่ทราบสาเหตุครับ

**Blind forced-choice answer key:** a judge picks the **over-edited version** — it
inserted "ผม" into nearly every clause (breaking pro-drop), glued "ครับ" onto every
sentence (mechanical over-application), added "ได้ทำการย้าย", "เป็นไปด้วยดี",
"ถูกย้าย" (the neutral-passive "ถูก"), and "นอกจากนี้". Every one of those is a `th.md`
tell. The input is a real post.

**A regression here looks like:** the skill inserts subject pronouns; adds ครับ/ค่ะ to
each sentence; "ย้ายระบบ … ใช้เวลาครึ่งวัน" becomes "ผมได้ทำการย้าย … ผมใช้เวลาประมาณ
ครึ่งวัน"; "ขี้เกียจเอง" becomes a formal clause; or "ถูกย้าย" appears.
