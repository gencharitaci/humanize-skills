# Language: Persian / Farsi (fa)

Pairs with `references/core-rules.md` and `references/structural-pass.md`. Synthesized
from `similar-github-projects/by-language/fa/humanizer-fa-1` ("deslop"), a bilingual
EN/FA skill built around a **layered, increasing-risk architecture** rather than a flat
pattern list — that architecture is worth keeping, not just its content. Tier-2, wave 2.
**Right-to-left script and layout handling still needs separate verification** beyond
the pattern content covered here, per the roadmap's risk note (the same open item as
Arabic's).

## Rule zero — don't chase undetectability

The source states this before anything else, and it's worth stating first here too:
the goal is not to defeat a detector, it's to sound like a person who actually wrote
the sentence. Zero-defect, maximally-average text has no voice either — a human writer
has tics, an inconsistent register in places, and small imperfections. Optimizing
purely against a checklist produces the same flatness it's supposed to fix, just with
different symptoms.

## The four layers — increasing risk, apply in order

| Layer | Content | Risk | Judgment needed |
|---|---|---|---|
| 1. Orthography (رسم‌الخط) | ZWNJ half-space, Arabic-vs-Persian letterforms, digit system, punctuation | Lowest — never damages meaning | None; apply everywhere |
| 2. Register (ثبت زبانی) | Bureaucratic/translated verb forms, swollen prepositions, «توسط» passive, compound-verb inflation, over-chained ezafe | Low | Almost none — a plain verb almost never loses meaning a bureaucratic one carried |
| 3. Phrases (عبارات) | Ready-made LLM phrases — hedge openers, importance inflation, empty time-framing, filler adverbs, repeated connectors, promotional language, chatbot residue, vague attribution | Medium — some phrases occur in human text too; **density, not presence, is the signal** | Some — count before cutting |
| 4. Structure (ساختار) | Negative parallelism, forced triads, missing-agent constructions, distant-narrator framing, information buried at the end, rhythm uniformity | Highest — can change the author's voice | Full judgment required; if you can't name the specific defect, don't touch the sentence |

Work top to bottom. Layer 1 is safe to apply everywhere, unconditionally. Layer 4
requires being able to articulate exactly what's wrong with a given sentence before
touching it — "I can't tell you the problem" means leave it alone.

## The protected list — read this before cutting anything

The source is explicit that this is the single most important file in the whole
skill: purely blocklist-based tools fire on healthy text and sterilize an author's
actual voice. Never remove these, even if another rule in this file seems to say to:

- **Physical markers of a real writer**: letter elongation (خواااهش, مرررسی, نههه,
  عاااالی), repeated punctuation (`!!!`, `؟؟`, `...`), Finglish shouting in all caps,
  a minor typo left sitting in running text. No model produces these on its own —
  removing them removes the only hard evidence the text is human.
- **Emoji placement, not emoji itself, is the signal**: an emoji at the very end of a
  message or paragraph is a protected human signature; an emoji inside a heading or at
  the start of a list item is a mechanical tell. Same character, opposite verdict —
  check position before deciding.
- **Colloquial contractions in informal text stay colloquial**: میشه، نمیشه، بریم،
  اینا، چیه، کجاست، دیگه، خیلی خب، آره، نه بابا. Formalizing "میشه" to "می‌شود" in a
  channel message turns a person into a memo — do not apply Layer 2's register fixes
  to text that was never meant to be formal.
- **Finglish and technical loanwords are not translation targets**: دیپلوی، ریکوئست،
  مرج، کامیت، برنچ، کش، لاگ، تست، بیلد، سرور، اندپوینت، مایگریشن، دیباگ، ریفکتور. In a
  developer's own text, "درخواست" instead of "ریکوئست" reads more artificial than the
  loanword itself.
- **Politeness up to one instance is not filler**: Persian is a high-politeness
  language (تعارف), and stripping it entirely per an English-style softening-removal
  rule makes the text rude, not clean. One "لطفاً," one "ممنون"/"سپاسگزارم," one
  "خواهش می‌کنم," an address like "دوستان عزیز" — each stays once. Only cut the
  *repetition* — three "لطفاً" in one short message means removing two, not all three.
  This is a direct, named exception to the engine's general stop-slop softening rule,
  which was written for English and over-corrects Persian politeness into curtness.
- **Personal voice markers**: first person ("من فکر می‌کنم," "به نظرم"), hedged
  uncertainty ("مطمئن نیستم," "شاید اشتباه کنم"), humor, irony, self-deprecation,
  cultural references, proverbs, poetry, an unfinished sentence or a real tangent.
- **Deliberate contradiction**: if a writer states two conflicting things in one piece
  and is evidently aware of it, that's a sign of someone thinking on the page, not an
  error to smooth over.
- **The reversal test**: if a revision reads "cleaner but more lifeless," walk it
  back. The operative question is whether the original author would read the result
  and say "this is still my own words" — if their reaction would be "this isn't mine
  anymore," no amount of pattern-compliance elsewhere makes the edit correct. This is
  Persian's version of the engine's voice-floor gate, stated as a hard non-tradable
  check rather than a soft guideline.

## Layer 1 — orthography (safe, apply everywhere)

A single instance of any of these is not itself an AI tell — humans mistype too. What
signals machine or careless-copy origin is **inconsistency within one text**: half the
verbs correctly ZWNJ'd and half not.

**Half-space (ZWNJ, U+200C)**: می‌شود (not می شود / میشود), نمی‌توان (not نمی توان),
کتاب‌ها (not کتاب ها / کتابها), به‌جای, هیچ‌کدام, آن‌ها, بی‌خود. Verbal prefixes
(می، نمی), plural suffix ها, comparative/superlative تر/ترین, and closed compounds
all take the half-space. Exception: some styles legitimately write آنها/کتابها
solid throughout — if the source text is consistently solid, leave that convention
alone and fix only internal inconsistency, don't impose the half-space over a
deliberate house style.

**Arabic letterforms instead of Persian**: ي (U+064A) → ی (U+06CC); ك (U+0643) →
ک (U+06A9); ة → ه. One of the strongest signals available — a Persian keyboard
cannot produce these characters, so their presence means the text was copied from an
Arabic-sourced document or generated by a model that doesn't distinguish the scripts.

**Digit systems**: three coexist — Persian (۰۱۲۳۴۵۶۷۸۹), Arabic-Indic
(٠١٢٣٤٥٦٧٨٩), and Latin (0123456789). Pick one and hold it for the whole text; mixing
is a tell. Default for Persian prose: Persian digits. Exception: software versions,
code, addresses, and numeric values inside a code block stay Latin.

**Punctuation**: «نقل قول» not "quote"; ویرگول «،» not comma «,»; «؛» not
semicolon «;»; «؟» not question mark «?»; no space before a period or comma; exactly
one space after a comma.

**Variant spellings**: مسئله/مسأله, خانه‌ی من/خانهٔ من, می‌گیرد/میگیرد (older style)
are all individually correct — the fix is internal consistency, not picking a
"correct" one.

**Latin terms inside Persian text**: Finglish and protected technical terms keep
their Latin spelling — fix only the spacing around them for correct RTL rendering
("از docker استفاده کردم" → "از Docker استفاده کردم," capitalized per its own official
spelling, with balanced spacing on both sides).

## Layer 2 — register (low risk)

Persian LLM output drifts toward a bureaucratic/translated register. This layer pulls
it back to standard spoken-register Persian. It's the second-lowest risk layer because
a bureaucratic verb almost never carries meaning a plain verb can't.

**Bureaucratic verb forms** — می‌باشد is the single strongest tell in this whole layer;
no Persian speaker uses it in speech, and its presence almost always means the text
came from an administrative template or a model.

| Instead of | Write |
|---|---|
| می‌باشد / می‌باشند | است / هستند |
| گردید / گشت / می‌گردد | شد / می‌شود |
| نمود / می‌نماید | کرد / می‌کند |
| بایستی | باید |
| گردیده است | شده است |

**Swollen prepositions**: جهت → برای; به منظور → برای; در راستای → برای; با عنایت به →
با توجه به; در خصوص/در باب → درباره‌ی; مضاف بر این → ضمناً or cut; فارغ از → جدا از.

**The «توسط» passive** — passive voice itself is entirely natural in Persian ("کشته
شد," "منتشر شد" are fine on their own); the actual problem is the specific
`توسط X + passive verb` construction, a literal calque of English "by X." Persian
almost always has a shorter active form:

| Instead of | Write |
|---|---|
| این تغییر توسط تیم اعمال شد | تیم این تغییر را اعمال کرد |
| گزارش توسط او نوشته شده بود | او گزارش را نوشته بود |
| باگ توسط کاربر گزارش شد | کاربر باگ را گزارش کرد |

Rule: if the agent is present in the sentence, use active voice. If the agent is
genuinely unknown or unimportant, leave the plain passive (without «توسط») alone.

**Inflated compound verbs**: مورد بررسی قرار گرفت → بررسی شد; مورد استفاده قرار
می‌گیرد → استفاده می‌شود; اقدام به ثبت‌نام نمود → ثبت‌نام کرد; حائز اهمیت است → مهم
است; دارای قابلیت X است → X را دارد; از X برخوردار است → X دارد; به انجام رساند →
انجام داد; مبادرت ورزید → کرد; ارائه نمود → داد/ارائه کرد. The `مورد ... قرار گرفتن`
pattern specifically can almost always be shortened.

**Excess nominalization**: machine-register Persian turns a verb into a noun and
bolts an empty verb onto it — انجام بررسی‌ها صورت گرفت → بررسی کردیم; اعمال تغییرات
انجام شد → تغییر دادیم; صورت‌پذیرفتن فرایند ثبت → ثبت شد.

**Over-chained ezafe (اضافه)**: more than three ezafe links in a row makes a sentence
unreadable and reads as machine-produced — بد: توسعه‌ی پایدارِ زیرساختِ اقتصادِ دیجیتالِ
کشور؛ خوب: زیرساخت اقتصاد دیجیتال کشور، به شکل پایدار. Fix by breaking the chain,
converting one link to a preposition or a verb.

**Genre exception**: in deliberately formal text — an official letter, legal text,
academic correspondence — some of these verbs are simply part of the genre. In that
case fix only the «توسط»-passive and the inflated compound verbs, and leave the rest;
match the register from context rather than flattening formal genres to casual ones.

## Layer 3 — phrases (medium risk — count before cutting)

Ready-made phrases Persian LLM output returns to. Risk is medium because some of
these occur in human writing too — the tell is **density**, not any single instance.
One natural "در واقع" is fine; four in one paragraph is a tell.

**Throat-clearing before the actual point** — delete and go straight to the content:
شایان ذکر است; لازم به ذکر است/قابل ذکر است; باید توجه داشت که; نکته‌ی جالب اینجاست
که; بگذارید واضح بگویم; حقیقت این است که; واقعیت این است که; بیایید نگاهی بیندازیم به;
در ادامه به بررسی X می‌پردازیم.

**Importance inflation** — a sentence that claims significance without saying
anything concrete: نقش مهمی ایفا می‌کند; نقش بسزایی دارد; از اهمیت ویژه‌ای برخوردار
است; گامی مهم در راستای; نقطه‌ی عطفی در; سنگ بنای; میراثی ماندگار; تحولی شگرف; جایگاه
ویژه‌ای دارد. Fix: say exactly what it does — "نقش مهمی در امنیت ایفا می‌کند" →
"جلوی دسترسی بدون توکن را می‌گیرد."

**Empty time-framing** (always fully removable — the sentence works without them): در
دنیای امروز; در دنیای پرشتاب امروز; در عصر حاضر; در عصر دیجیتال; امروزه بیش از هر
زمان دیگری; در سال‌های اخیر (when no actual year is meant).

**Empty adverbs and emphasis**: Persian has no morphological marker for adverbs, so
"cut every adverb" is a meaningless rule — target only these, and only when they add
nothing: قطعاً/مسلماً/بی‌شک/بدون شک; کاملاً; حقیقتاً/واقعاً (when purely emphatic);
صرفاً; عملاً (when not standing in for "in practice"); به‌شدت; بسیار (when stacked);
اساساً/بنیادی‌ن‌طور. Test: delete it — if the meaning is unchanged, cut it.

**Repeated connectors**: همچنین; علاوه بر این; از سوی دیگر/از طرف دیگر; به عبارت
دیگر; در واقع; بنابراین. None are banned — the rule is **at most one use of each per
text**. Consecutive paragraphs opening with «همچنین» is a machine-text signature; it's
a direct equivalent of English "Additionally" and the single strongest tell in this
category.

**Promotional language**: خیره‌کننده/نفس‌گیر/بی‌نظیر/بی‌بدیل; شگفت‌انگیز/حیرت‌انگیز;
غنی (فرهنگ غنی، تاریخ غنی، تجربه‌ی غنی); در دل [شهر/کوهستان/طبیعت]; تجربه‌ای
فراموش‌نشدنی; ترکیبی بی‌نظیر از; دنیایی از.

**High-frequency machine vocabulary** (a documented post-2023 spike, and these tend
to cluster together): بستر، زیرساخت (when metaphorical)، چشم‌انداز (meaning
"situation")، رویکرد، راهکار، کلیدی، حیاتی، محوری، بنیادین، هدفمند، پویا، نوین، جامع،
بهینه، ارتقا، تعامل، هم‌افزایی، پتانسیل، ظرفیت‌سازی. None are inherently bad; three of
them in one paragraph is the signal to rewrite the paragraph.

**Chatbot residue** — if these survive into a final text, they were copied straight
from a chat window; remove all of them, no exceptions: سؤال بسیار خوبی است!;
البته!/حتماً!; امیدوارم این مطلب مفید بوده باشد; اگر سؤالی داشتید، بپرسید; در ادامه، X
را برایتان توضیح می‌دهم; به‌عنوان یک مدل زبانی; تا جایی که اطلاعات من به‌روز است; بر
اساس اطلاعات موجود.

**Vague commentary that names no actual content**: پیامدهای آن گسترده است; دلایل آن
ساختاری است; این موضوع پیچیدگی‌های خاص خود را دارد; ابعاد مختلفی دارد; جای بحث بسیار
دارد. Either cut, or replace with the specific thing being gestured at.

**Vague attribution**: کارشناسان معتقدند; بسیاری از صاحب‌نظران; بر اساس گزارش‌ها;
تحقیقات نشان می‌دهد; آمارها حاکی از آن است که. If a real source exists, name it. If
not, cut the claim rather than dressing it up with a fake-specific or vague citation.

## Layer 4 — structure (highest risk — full judgment required)

Every change at this layer can shift the author's voice. Before touching any sentence
here, be able to state precisely what's wrong with it; if you can't, leave it alone.

**Negative parallelism (تقابل دوتایی)** — Persian's version of the English
not-only-but-also tell; negates the first half purely to inflate the second:

| Pattern | Problem |
|---|---|
| نه تنها X، بلکه Y | artificial weight increase |
| مسئله X نیست، Y است | predictable pivot |
| این فقط X نیست؛ Y است | same pattern |
| سؤال این نیست که X، سؤال این است که Y | rhetorical deflection |
| دیگر X نیست، تبدیل شده به Y | manufactured transformation arc |

Fix: state only the second half — "نه تنها سریع است، بلکه امن هم هست" → "سریع و امن
است." **Caveat**: "نه تنها... بلکه..." has a long, legitimate history in formal and
literary Persian and is not automatically a tell. One instance across a whole text —
leave it. Two or more — fix it.

**The forced, balanced triad**: machine Persian arranges ideas into evenly-weighted
threes to sound comprehensive — bad: سریع، دقیق و مطمئن; آموزش، پژوهش و نوآوری; با
تعهد، دقت و پشتکار. Fix: keep two, or keep one that actually says something.
Exception: if the three items are genuinely three distinct things (three files, three
steps, three environments), there's no problem — the defect is synonymous items
strung together purely for rhythm, not the number three itself.

**Missing agent (فاعل گمشده)**: giving a human action to an inanimate thing — the
machine's way of avoiding naming who actually did something:

| Weak | Better |
|---|---|
| این تصمیم شکل گرفت | تیم تصمیم گرفت |
| فرهنگ سازمان تغییر کرد | آدم‌ها رفتارشان را عوض کردند |
| داده‌ها به ما می‌گویند | من از داده‌ها این را برداشت کردم |
| بازار پاداش می‌دهد | مشتری پول می‌دهد |
| نیاز احساس شد | ما لازم داشتیم |

If there's genuinely no specific agent, use «شما» and put the reader in the scene.
**Exception**: in technical text, an inanimate subject is often simply correct —
"سرویس ریکوئست را رد می‌کند" is a precise sentence, not a missing-agent defect; this
rule is inactive in technical mode.

**Distant-narrator framing**: کسی این را طراحی نکرده; آدم‌ها معمولاً...; این اتفاق
می‌افتد چون...; به همین دلیل است که... Fix: put the reader in the scene directly —
"شما یک روز نمی‌نشینید تصمیم بگیرید که..." This rule is also inactive in technical
mode and in channel-message register.

**Information placement — the single structural defect no English-language skill
catches**: the biggest structural problem specific to Persian AI text is that **the
most important information arrives at the end**. The common shape: a polite,
throat-clearing opening, then the body, and only in the final paragraph does it
become clear who the message is actually for. Fix: put audience, condition, and
exception first. If a message applies only to a specific group, say so in the very
first line. This is the one rule in this layer that stays active in every mode,
including technical and channel-message register, with no exception.

**Rhythm**:

| Pattern | Fix |
|---|---|
| every sentence the same length | break one, or merge two |
| a «و»-chain longer than three clauses | put a period |
| deeply nested «که» clauses | split into two sentences |
| every paragraph ending on the same rhetorical "punch" | vary it |
| a run of consecutive sentence fragments used for emphasis | write a complete sentence |

**On the dash specifically**: the em dash is not native Persian punctuation, and the
engine's general stop-slop dash rule doesn't map cleanly here — Persian's natural
equivalent is the parenthesis and the comma. If a text is full of explanatory
parentheticals, work some of them into the sentence itself rather than converting them
to dashes.

**Formatting tells**: mechanically bolding terms for no reason; an emoji in a heading
(a definite tell — contrast with an emoji at the very end of a message, which is
protected, see above); a list built from a bolded label plus a colon (raw chatbot
output shape); every list item running the exact same length.

**Formulaic conclusions**: در نهایت می‌توان نتیجه گرفت که; به‌طور کلی می‌توان گفت;
آینده‌ی روشنی در انتظار X است; مسیر پیش رو هموار نیست، اما; با این حال، امید می‌رود
که. Cut the closing clause and end the text on its last real point.

## What NOT to flag

Everything in the protected list above; a single "نه تنها... بلکه..." across a whole
text; a genuinely three-item list where the items are actually distinct; an inanimate
subject in technical prose; passive voice with no «توسط» and no recoverable agent;
formal-register verb forms in a genuinely formal genre (official letter, legal text,
academic correspondence); one instance of any Layer 3 phrase in an otherwise natural
paragraph.

### Opener rotation and pre-flight carve-out

Conjunction openers: اما, و, بنابراین, هرچند. Moderated taarof openers in
business prose are register-correct, not padding; Arabic-register overload in
plain prose is banned. Pre-flight carve-out: none confirmed; script/layout
handling still unverified — pattern rows only.

## Register table

| Register | Layer 2 (bureaucratic verbs) | Politeness (تعارف) | Colloquial contractions | Dash → alternative |
|---|---|---|---|---|
| Official / legal / academic correspondence | Genre-appropriate — fix only «توسط»-passive and inflated compounds | Keep formal register fully | None expected | Parenthesis |
| General prose / article / report | Fix fully | One instance per polite phrase | N/A | Parenthesis or comma |
| Channel message / chat / informal | Fix fully but leave colloquial verb forms alone | One instance per polite phrase | Preserve — do not formalize | Comma |
| Technical (docs, code-adjacent) | Fix fully | Minimal | N/A | Parenthesis; missing-agent rule inactive |

## Worked example

**Before:**
> شایان ذکر است که در دنیای امروز، تحول دیجیتال نه تنها برای کسب‌وکارها ضروری است،
> بلکه یک فرصت انقلابی نیز می‌باشد. این امر نه تنها کارایی را افزایش می‌دهد، بلکه
> هزینه‌ها را نیز کاهش می‌دهد. در نهایت می‌توان نتیجه گرفت که این راهکار جامع، پتانسیل
> هر سازمانی را آزاد می‌کند.

**After:**
> تحول دیجیتال روشِ کارِ تیم را عوض می‌کند، ولی نه به یک شکل برای همه.
> (متن اصلی می‌گوید «کارایی را بالا می‌برد» و «هزینه‌ها را کم می‌کند» اما هیچ عددی ندارد؛
> برای استفاده‌ی بیرونی باید عدد واقعی بیاید. اینجا هیچ رقمی ساخته نشده است.)

**Changes:** the throat-clearing opener ("شایان ذکر است") and empty time-framing
("در دنیای امروز") were removed; the bureaucratic verb ("می‌باشد") and the negative
parallelism used twice ("نه تنها... بلکه...") were cut; the high-frequency vocabulary
cluster ("راهکار جامع," "پتانسیل") and the formulaic conclusion ("در نهایت می‌توان
نتیجه گرفت که") were removed. The draft states no measurable result, so the "how much
did it change" is flagged as missing rather than filled with an invented figure (an
earlier version of this example invented "سه روز به چهار ساعت" — the protected list
and rule zero forbid that). The parenthesis is used instead of an em dash, per the
Layer 4 note that the em dash is not native Persian punctuation.

## Sources

`similar-github-projects/by-language/fa/humanizer-fa-1/skills/deslop` — the four-layer
risk architecture (`references/fa/orthography.md`, `register.md`, `phrases.md`,
`structures.md`), the protected list (`protected.md`), and the rule-zero/voice-floor
framing this file draws on for all of its content; a bilingual EN/FA skill, part of a
broader "human-writer" style family also covering Hindi, French, Spanish, Portuguese,
German, and Arabic as sibling satellites (see `references/languages/hi.md`). A second
independent Persian source would still strengthen cross-checking, per the roadmap's
native-verification risk note — none was found in the original survey.
