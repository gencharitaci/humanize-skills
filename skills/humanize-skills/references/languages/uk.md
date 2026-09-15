# Language: Ukrainian (uk)

Pairs with `references/core-rules.md` and `references/structural-pass.md`. Synthesized
from two repos in `similar-github-projects/by-language/uk/`: a marketing/social-focused
RU/UK/EN trilingual editor with format-specific editing intensity
(`humanizer-uk-1`) and a literary-culture-grounded specialist, "anti-slop-ua"
(`humanizer-uk-2`), built specifically to catch what English-language humanizers miss
in Ukrainian — calques and a native dash rule English tools tend to break. Tier-2,
wave 1.

## The core framing (from anti-slop-ua, worth stating up front)

English-language humanizer skills don't see calques from Russian, and worse, they
actively damage native Ukrainian punctuation by treating the dash as a universal AI
tell — it isn't in Ukrainian. A Ukrainian-specific pass has to do the opposite of
what an English pass does in at least one respect: leave the dash alone and hunt
calques instead. **Preserve fact and content. Change only form** — never invent
names, dates, numbers, or quotes; never add a claim absent from the original.

## Calques and Russianisms — the single most important marker

This is the most frequent tell in machine-generated or poorly-translated Ukrainian,
ranked above ordinary AI vocabulary and canceralit in both source repos. Fix on
sight, always:

| Calque / Russianism | Correct Ukrainian |
|---|---|
| приймати участь | брати участь |
| в залежності від | залежно від |
| на протязі (року) | протягом (року) |
| відноситися до | стосуватися / належати до |
| так як (causal) | оскільки / бо |
| в кінці кінців | зрештою / врешті-решт |
| співпадати | збігатися |
| слідуючий | наступний |
| заключається в | полягає в |
| у відповідності з | відповідно до |
| на рахунок (питання) | щодо / стосовно |
| діючий (закон, чемпіон) | чинний / теперішній |
| являється | є / це |
| потрібно відмітити | варто зазначити |
| в даний час / на даний момент | зараз / нині |
| задача (у значенні "доручення") | завдання |
| міроприємство | захід |
| поступати (в університет) | вступати |
| приймати рішення | ухвалювати рішення |
| прийняти міри | вжити заходів |
| покупатель | покупець |
| любий (у значенні "будь-який") | будь-який |
| відмінити | скасувати |
| виключення (exception) | виняток |
| вияснити | з'ясувати |
| по причині | через |
| при допомозі | за допомогою |
| в основному | здебільшого / переважно |
| знаходитися (бути десь) | бути / розташовуватися |
| на сьогоднішній день | сьогодні / нині |
| більше всього / краще всього | найбільше / найкраще |
| по крайній мірі | принаймні |
| не дивлячись на | попри / незважаючи на |
| тим не менше | проте / а втім / однак |
| в результаті | унаслідок / як наслідок |
| за рахунок (чогось) | коштом / завдяки / через |
| у якості (прикладу) | як / за (приклад) |
| дякую вас | дякую вам |

**Context matters — don't auto-correct a legitimate sense**: "задача" is correct in
mathematics ("розв'язати задачу"), just not meaning "an assigned task"; "відношення"
is correct in math/logic, not meaning "attitude"; "вірний" is correct meaning
"loyal" (вірний друг), not "correct"; "любий" is correct meaning "dear/beloved," not
"any." Check the sense before flagging — this table lists the wrong sense, not the
word itself.

## Active present participles on -уч/-юч/-ач/-яч — almost non-existent in Ukrainian

Ukrainian barely has active present participles of this form at all; their presence
is close to a direct Russian-grammar calque. Rebuild through "який…" or a native
adjective/noun:

оточуючий → навколишній/довколишній · діючий → чинний · слідуючий → наступний ·
біжучий → поточний · керуючий → керівний/керівник · пануючий → панівний · існуючий →
наявний/що існує · захоплюючий → захопливий (**not** захоплюючий) · вражаючий →
разючий/вражальний/який вражає · відпочиваючі → відпочивальники · бажаючі → охочі ·
наступаючий → прийдешній/який настає.

## Canceralit (канцелярит)

**Deverbal nouns instead of verbs**: здійснювати продаж → продавати; проводити
оплату → оплачувати/платити; надавати допомогу → допомагати; вести розробку сайту →
робити сайт; проводити налаштування → налаштовувати.
Before: "Ми здійснюємо надання послуг з розробки та просування." After: "Ми робимо
сайти й просуваємо їх."

**Genitive-case chains**: "Процес підвищення рівня ефективності роботи відділу
продажів" → "Відділ продажів працює ефективніше." Break the chain into a subject and
a verb.

**Copula avoidance**: являє собою → це; є рішенням → вирішує/це рішення; виступає в
ролі → працює як; слугує інструментом → допомагає. Before: "Наша CRM є ефективним
інструментом, який являє собою платформу для автоматизації." After: "Наша CRM
автоматизує продажі. І працює."

**Passive instead of active**: "Заявки обробляються менеджерами протягом дня." →
"Менеджери відповідають на заявки за день."

**Loanwords with a plain native equivalent**: імплементувати → впровадити; дедлайн →
термін; консенсус → згода; фідбек → відгук; таск → завдання. Domain terms with no
good native equivalent stay — CRM, SEO, GEO, конверсія.

## AI vocabulary and filler

**Overloaded significance vocabulary**: ключовий, найважливіший, вирішальний,
доленосний, знаменує, символізує, свідчить, підкреслює, демонструє, сприяє,
забезпечує, формує. Before: "Даний підхід є ключовим чинником, що сприяє формуванню
сталого зростання." After: "Цей підхід дає зростання."

**Formulaic transitions and hedging**: "Важливо зазначити, що…", "Варто підкреслити,
що…", "Що стосується…" — cut. "Можливо, певною мірою це може мати деякий вплив" →
"Це впливає."

**Chatbot artifacts and eagerness**: "Чудове запитання!", "Ви цілком маєте рацію!",
"Сподіваюся, це допоможе!", "Дайте знати, якщо потрібно уточнити" — remove entirely.

## Marketing/infobiz cliché

Dead clichés: "широкий спектр послуг", "індивідуальний підхід до кожного клієнта",
"команда професіоналів", "висока якість за доступними цінами", "динамічна компанія",
"лідер ринку", "інноваційне рішення". Before: "Команда професіоналів пропонує
широкий спектр послуг та індивідуальний підхід." After: "Робимо сайти й
налаштовуємо під них рекламу. Беремо 3 проєкти на місяць."

Infobiz pathos and fake urgency: "вийти на новий рівень", "прокачати", "розкрий
свій потенціал", "трансформація", "встигни", "лише сьогодні", "залишилось 2 місця"
(when untrue) → replace with a concrete result; urgency only when it's real.

## AI structural patterns (from anti-slop-ua — marker #1)

**Definition through negation — the single most decisive structural marker**: "не X,
а Y", "X, а не Y", "не просто X — це Y", "жодна з них не про X". Don't define a thing
by what it isn't — say directly what it IS. Before: "Анкета не бюрократія — а спосіб…"
After: "Анкета — це спосіб зібрати всю потрібну інформацію." This pattern ranks above
ordinary negative-parallelism lists in the source specifically because Ukrainian
critics identified it as the clearest single tell — treat any instance as worth a
second look, not just a cluster.

**Crutch triads**: "швидко, надійно, зручно" → one concrete claim.

**"Не лише… а й" overuse** → cut half of the instances.

**Meta-commentary**: "Варто зазначити, що", "У цій статті ми розглянемо", "Не
секрет, що", "Як відомо" — delete, state the substance directly.

**The aphoristic paragraph-closer**: a slogan, metaphor, or "wisdom" line closing a
paragraph ("пів години економлять місяці") → replace with a direct causal sentence or
an imperative.

**Rhetorical staccato**: short parallel fragments stacked for punch ("Жодна з них не
про фах. Усі вони про…") → sew into one connected sentence, often via "Якщо…, то…".

**False agency**: "стаття підкреслює", "технологія диктує" — name the actual person
or action instead of attributing agency to an abstraction or an artifact.

**Empty time-framing**: "У сучасному світі", "У світі, де", "З розвитком технологій"
— discard.

## Punctuation — the dash is native, don't touch it

This is the rule most likely to be gotten wrong by an English-trained pass. The dash
is **mandatory** in Ukrainian in several constructions and is **not** an AI marker:
subject-predicate ("Київ — столиця"), an elided verb, direct speech, an appositive.
**Leave it alone.** The actual target is only AI's habit of using "—" as a dramatic
pause in every other sentence, purely as a rhythm crutch — that specific overuse
pattern, not the character itself.

**A subtler case**: when a dash is holding up a slogan-style antithesis ("Ця
розмова — вже Y, а не Z"), the dash isn't the problem, the antithesis is. Cut "а не
Z" first; if the remaining phrase still reads like a slogan, replace the dash with an
explicit "є" ("Ця розмова вже є Y") rather than removing the dash mechanically.

**Other punctuation**: Ukrainian guillemets «…» are the norm, not straight quotes
"…" — convert on sight. The apostrophe is `'` (об'єкт, п'ять, здоров'я, інтерв'ю,
комп'ютер, прем'єра) — never a Latin acute or omitted entirely.

## Rhythm and register

Vary sentence length — a short sentence after a long one. Break up a "metronome" (three
consecutive sentences of identical length/structure). Always use the vocative case in
direct address: Оксано, друже, пане Іване — not the bare nominative "Оксана," "друже"
(uninflected) reads as translated or careless. Use idiom where it actually fits,
don't force it in. Prefer active voice: "ми зробили," not "було зроблено." Pick "ти"
or "ви" for the whole piece and hold it. Avoid over-hedging (мабуть, певною мірою,
начебто) and avoid English-calque enthusiasm ("Давайте зануримося!" is a direct,
unnatural calque of "Let's dive in!").

**Natural repetition beats forced synonym variation**: a native speaker repeats
"ваш" or "співпраця" without discomfort — don't swap in an artificial synonym purely
for variety's sake; that impulse is itself often an AI tell, not a fix for one.

## 2019 spelling-reform signals — small markers that a human actually edited the text

проєкт (not проект), авдиторія (an accepted variant), ґ in native words where it
belongs (ґрунт, ґанок, ґудзик, ґречний), пів written separately (пів години, not
півгодини), and natural feminitives (авторка, дизайнерка, підприємиця, засновниця,
експертка, клієнтка). None of these are AI-vs-human tells on their own, but their
consistent, correct presence is a small positive signal that a human writer or editor
actually touched the text.

## Format-specific editing intensity

The same underlying text gets edited to different degrees depending on where it will
live — **the shorter the format, the more ruthlessly it should be cut**:

| Format | Tone | Focus |
|---|---|---|
| Landing page / hero | Concrete, confident, no pathos | One idea per screen, verbs, numbers, a real offer instead of "innovative solutions" |
| Social post (Instagram/Threads/Telegram) | Conversational, personal, first person | Hook in line one, short paragraphs, emotion, specificity |
| DM / lead message | Like a real person messaging | No script feel, to the point, one clear next step |
| Business offer / proposal / letter | Businesslike but human | Result stated instead of process, numbers instead of adjectives |
| Article / long-form | Popular-science register, rhythm | Sentence-length variety, real examples, the author's own opinion |

A post or a DM tolerates zero wasted words; an article can legitimately carry longer
sentences for rhythm's sake.

## Self-check before delivering

Does it sound natural read aloud? Is there variety in sentence length and structure?
Concrete numbers/details instead of abstractions? Is every fact from the original
preserved, nothing invented? Is there a voice — a real person behind it? No item from
the universal hard-ban list present? No calques, no Russianisms, no active
participles on -уч/-юч left uncorrected? Does the register match the format (a post
isn't a landing page isn't a business proposal)?

## What NOT to flag

The dash in any of its mandatory native uses (subject-predicate, elided verb, direct
speech, an appositive); "задача"/"відношення"/"вірний"/"любий" in their legitimate
senses (see the calque table's caveat); feminitives; the vocative case; natural word
repetition where a forced synonym would be worse; domain terms with no good native
replacement (CRM, SEO, GEO, конверсія).

### Opener rotation and pre-flight carve-out

Conjunction openers: А, І, Але, Чи, Зате. Verb-first is natural. Scan openers
for Russianisms first (із-за → через, так як → бо) — a surzhyk opener fails
before any rhythm question arises. Pre-flight carve-out: none confirmed —
universal pre-flight applies; native review may add one.

## Worked example

**Before:**
> Важливо зазначити, що в сучасному світі кожен підприємець стикається з рядом
> викликів. Наша команда професіоналів пропонує інноваційні рішення, які допоможуть
> вийти на новий рівень та розкрити свій потенціал!

**After:**
> Більшість сайтів у малому бізнесі не приносять заявок. Не тому, що «поганий
> дизайн», а тому, що на них незрозуміло, що робити далі. Я роблю сторінки, з яких
> людина одразу розуміє наступний крок. Покажу на вашому прикладі — напишіть
> «АУДИТ».

**Changes:** the meta-commentary opener ("Важливо зазначити, що") and empty
time-framing ("в сучасному світі") were cut; the dead clichés ("команда
професіоналів," "інноваційні рішення") and infobiz pathos ("вийти на новий рівень,"
"розкрити свій потенціал") were replaced with a concrete claim and offer; note the
surviving dash in "не тому, що «поганий дизайн», а тому, що" is fine as ordinary
contrastive punctuation, not the flagged "—"-as-drama-pause pattern, and the final
dash before the call-to-action is a native elided-verb construction, left untouched.

## Sources

`similar-github-projects/by-language/uk/humanizer-uk-1` — the trilingual RU/UK/EN
router, the format-specific editing-intensity table, and the calque/canceralit/
participle tables this file draws on most; `humanizer-uk-2` ("anti-slop-ua") — the
definition-through-negation marker, the native-dash-preservation rule, the 2019
spelling-reform signal list, and the literary-culture source grounding (Antonenko-
Davydovych, Ponomariv, Karavansky, Vykhovanets, Chak, Selihei, the 2019 Ukrainian
orthography). A third repo, `humanizer-uk-3`, exists in the same folder for further
cross-checking.
