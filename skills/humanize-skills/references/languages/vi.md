# Language: Vietnamese (vi)

Pairs with `references/core-rules.md` and `references/structural-pass.md`. Synthesized
from two repos in `similar-github-projects/by-language/vi/`: a general-purpose editor
(`humanizer-vi-1`) and an administrative-document specialist grounded in Vietnam's
Decree 30/2020/NĐ-CP on official correspondence (`humanizer-vi-2`, 32 patterns). Tier-2,
wave 1.

## Genre gate — determine first, and default to the stricter one

**Administrative** (công văn, tờ trình, báo cáo, quyết định, kế hoạch, and anything
addressed to a government body or organization) is the default when unclear, and it is
the stricter mode: no personality injection, no first person, no casual register — the
correct "human voice" here *is* the formal official register itself (khách quan,
chính xác, trang trọng, ngắn gọn, and correctly formatted per Decree 30's fixed
structure). **General content** (blog, essay, marketing, script) only activates when
the requester says so explicitly, or the text clearly isn't administrative.

Administrative-register tells (any one is enough to default to this mode, regardless
of what the requester asked for): a national letterhead/motto block, a document
number in the "Số: .../...-..." format, "Kính gửi:"/"Nơi nhận:" lines, a "TM./KT./TL."
signature block, or "Căn cứ..." clauses.

## The ≥2-signal over-edit guard (apply this before anything else)

Only rewrite a sentence when it carries **two or more** AI signals at once. A sentence
with only one isolated signal, or one that already contains a concrete fact (a number,
a name, a date), is left alone. When in doubt, leave it alone. This engine
deliberately favors under-editing over stripping a document clean — matching
`SKILL.md`'s no-edit gate, but given as an explicit numeric threshold specific to this
language's source.

## The two absolute invariants (administrative mode, non-negotiable)

1. **Never fabricate data.** Removing AI traces is a matter of phrasing, never of
   adding facts. Never insert a number, date, percentage, source name, or unit that
   the original didn't have. If a number is genuinely needed and missing, leave a
   placeholder (`[cần bổ sung số liệu]`) rather than inventing one — fabricating a
   number in an administrative or acceptance document is far more dangerous than any
   AI tell.
2. **Never touch Decree 30 formatting.** Preserve every formatting element and
   mandatory administrative phrase exactly (see the do-not-flag list below). Only
   remove hollow or inflated language from the actual content.

## Content patterns

**Significance inflation**: đóng vai trò quan trọng/then chốt, dấu mốc/bước ngoặt, ý
nghĩa to lớn/sâu sắc, mang tính lịch sử — state the plain fact instead ("Trung tâm
được thành lập năm 2019," not "đánh dấu một bước ngoặt mang tính lịch sử").

**Hollow tail clauses**: "..., góp phần...," "..., qua đó khẳng định...," "..., thể
hiện..." tacked onto a sentence to fake depth without adding information.

**Promotional/flowery language**: hùng vĩ, tuyệt đẹp, phong phú và đa dạng, giàu bản
sắc, thơ mộng, trù phú — a tell especially for place/culture topics.

**Vague attribution**: "Theo các chuyên gia," "Nhiều ý kiến cho rằng," "Các nghiên cứu
chỉ ra" with no named source. Name a real source (a report, a resolution) if one
exists in the original; otherwise state the fact plainly, never invent a source.

**The formulaic "difficulties and direction" block**: this section is legitimately
required in administrative documents — don't delete it — but only when it's genuinely
hollow and generic should it be replaced with the actual specific difficulty from the
file, never invented.

## Language and grammar

**Empty-intensifier vocabulary**: vô cùng, hết sức, ngày càng, sâu sắc, toàn diện,
vượt bậc, mạnh mẽ, quyết liệt stacked together ("hết sức chú trọng đẩy mạnh, tăng
cường mạnh mẽ") — keep when genuinely quantified, cut when just decorative.

**Redundant synonym pairs (song tiết hóa)**: "triển khai thực hiện," "tổ chức thực
hiện," "đảm bảo duy trì đầy đủ và kịp thời" — one word usually does the job. Note:
some pairs are standard administrative fixed phrases ("kiểm tra, giám sát") and Decree
30's own copy terminology ("sao y," "sao lục," "bản chính") — never touch those.

**Excess nominalization**: "việc triển khai," "công tác quản lý," and the machine-
translation-style "sự + X" pattern (sự phát triển, sự đa dạng) where a direct verb
reads better — but preserve "việc + verb" when it's functioning as a grammatical
subject ("Việc tính X cần được xác nhận"), where removing it breaks the sentence.

**Negative-symmetry overuse**: "Không chỉ... mà còn...," "Vừa... vừa..." repeated.

**The forced triad**: "nhanh chóng, kịp thời, hiệu quả" stacked with a second triad
right after it.

**Synonym-cycling for one entity** — but note standard administrative abbreviation
chains ("Sở Khoa học và Công nghệ" → "Sở" → "đơn vị") are legitimate shortenings, not a
tell; only flag when the renaming genuinely confuses which entity is being discussed.

**Run-on comma-chained sentences** — but never restructure the multi-line "Căn cứ ...;"
block or the "Nơi nhận:" list; those are fixed Decree 30 structure, not a run-on.

**Passive voice and subject-dropping overuse**: "được... một cách..." hiding an actor
that should be named — but standard administrative passives ("được ban hành," "được
phê duyệt") are correct official register, not a tell.

**Machine-translation syntax calques with no equivalent in other language files here**:
"và/hoặc" (and/or), "đối với việc" (regarding/with respect to), chained "của" phrases
("chuỗi 'của' liên hoàn" — the X of the Y of the Z), "trong khi đó thì," "bởi vì rằng."
These read as directly translated from English and essentially never occur in text a
Vietnamese speaker wrote natively.

**Encyclopedic-definition openings**: "X là một [cơ quan/đơn vị/địa phương]...," "nằm
ở/tọa lạc tại...," "được biết đến với..." — administrative documents don't open with a
dictionary-style definition; go straight to the substantive content.

## Formatting — including the mechanical dash tell

**Em/en dashes** (—/–): Vietnamese keyboards don't type these by default, and standard
administrative writing doesn't use a dash to insert a subordinate clause. Multiple
dashes, especially the ` — ` spaced form or a doubled `——`, is itself a mechanical
AI/machine-generated tell. Replace with, in priority order: a period, a comma, a colon,
or a rewrite. **Do not flag**: an ordinary hyphen in the national motto ("Độc lập - Tự
do - Hạnh phúc") or in compound terms ("kinh tế - xã hội"); an en-dash in a genuine
numeric range ("13–14," "20–25 mm"); a hyphen inside a document reference number
("Số: 15/2025/QĐ-UBND"); or a hyphen inside a foreign proper noun or technical term
("Retrieval-Augmented Generation").

**Bold overuse and bold-label bullet lists** — the same tell as most other languages
here, but note: goal/task/step enumeration lists are legitimate administrative bullets
and should be kept; only merge lists where each bullet's bolded label just restates
the sentence after the colon.

**Emoji**: never appears in administrative writing; remove entirely.

**Capitalization**: only capitalize the first letter of a sentence, proper nouns,
organization names, and titles paired with a name — never capitalize a whole phrase
for emphasis. Exceptions that are correct and must not be "fixed": the fully
capitalized national letterhead, fully capitalized document-type labels ("QUYẾT ĐỊNH,"
"BÁO CÁO"), fully capitalized organization names per Decree 30's own appendix, and
fully capitalized classification/urgency markers ("MẬT," "HỎA TỐC").

## Chatbot residue and knowledge-gap filling

Remove conversational residue ("Dưới đây là...," "Hy vọng thông tin này hữu ích," "Nếu
cần bổ sung, hãy cho tôi biết") and sycophantic tone ("Đây là một đề xuất rất tuyệt
vời"). For a knowledge gap, state plainly what's unknown ("Chưa xác định được năm
thành lập đơn vị trong hồ sơ hiện có") rather than writing a sentence about not knowing
and then filling it with a plausible-sounding guess.

## What must never be flagged — mandatory Decree 30 formatting

This is the single most important section for not damaging a real document: the
national letterhead and motto; document type labels in full caps; the document
number/symbol format (with its `/` and `-` exactly as given); place-and-date lines in
written-out form ("Hà Nội, ngày 05 tháng 3 năm 2020" — never abbreviate to numerals);
classification/urgency markers; opening/closing formulas ("Căn cứ...," "Kính gửi:,"
"Nơi nhận:," "Trân trọng."); the multi-line "Căn cứ ...;" block; the "Nơi nhận" list;
signature-role abbreviations (TM., KT., TL., TUQ., Q.); appendix references; and
Decree 30's own copy terminology. None of this is a template to "clean up" — it's the
correct form.

### Opener rotation and pre-flight carve-out

Conjunction openers: Nhưng, Và, Vì vậy, Tuy nhiên. Pronoun-by-status openers
(anh/chị/em + tên) carry more human signal than any conjunction rotation — audit
default "bạn/tôi" flatness first. Pre-flight carve-out: none confirmed —
universal pre-flight applies; native review may add one.

## Register table

| Register | New-fact tolerance | Personality/first person | Dash tolerance | Formatting flexibility |
|---|---|---|---|---|
| Administrative (default) | None — placeholder or omit instead | None | None | None — Decree 30 structure is fixed |
| General content (blog, marketing, script) | None beyond restructuring existing content | Full — see modes/creative.md | Low | Flexible |

## Worked example (administrative)

**Before:**
> Có thể khẳng định rằng, việc triển khai thực hiện đề án đã góp phần vô cùng quan
> trọng, tạo nên những chuyển biến sâu sắc và toàn diện, đánh dấu một bước ngoặt mang
> tính lịch sử trong công tác quản lý của đơn vị.

**After:**
> Đề án đã được triển khai và bước đầu cải thiện công tác quản lý của đơn vị.

**Changes:** the significance-inflation chain and the hollow tail clauses were
removed; the redundant synonym pair ("triển khai thực hiện") was reduced to one verb;
no number or date was added since the original had none — the fact-lock invariant
above takes priority over sounding more concrete.

## Sources

`similar-github-projects/by-language/vi/humanizer-vi-1` — general-purpose, register-
and preservation-focused; `humanizer-vi-2` — the 32-pattern administrative catalog
grounded in Decree 30/2020/NĐ-CP, this file's primary source for the genre gate and
the do-not-flag list. A third repo, `humanizer-vi-3`, exists in the same folder for
further cross-checking.
