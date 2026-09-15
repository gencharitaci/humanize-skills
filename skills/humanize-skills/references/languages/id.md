# Language: Indonesian (id)

Pairs with `references/core-rules.md` and `references/structural-pass.md`. Synthesized
from two complementary repos in `similar-github-projects/by-language/id/`: a general
register-first editor (`humanizer-id-2`) and a slang-density specialist built for
social/TTS content with a real 520-entry slang lexicon (`humanizer-id-3`). Tier-2,
wave 1.

## Register gate — ask before writing, every time

Always confirm target register before rewriting: **formal** (academic articles,
reports, official letters, corporate content), **semi-formal** (blogs, media articles,
educational content), or **casual/conversational** (social media, messaging, informal
content). Hold the chosen register consistently throughout — **register inconsistency
within one piece is one of the clearest AI tells in Indonesian specifically**, since
Indonesian AI output drifts between baku (standard) and gaul (slang) more visibly than
in most languages here.

## Copula avoidance — the single highest-priority Indonesian tell

AI avoids the plain "adalah" and reaches for "merupakan" (and its variants "merupakan
salah satu," "merupakan bagian dari") in contexts where it reads stiff and unnatural.
"Komunikasi yang efektif merupakan kunci keberhasilan" → restate directly and
concretely: "Tim yang berhasil biasanya punya komunikasi yang jelas — orang tahu apa
yang harus dikerjakan." This is worth checking first, before anything else on this
page.

## High-frequency AI vocabulary

sangat penting, krusial, vital, holistik, adaptif, inovatif, revolusioner,
komprehensif, signifikan, substansial, optimal, maksimal (used as a cliché) — these
cluster together far more often in post-2023 text than in ordinary writing; treat
co-occurrence as the actual signal.

**Unnecessary English loanwords**: "passionate," "men-deliver," "impactful" used where
a natural Indonesian equivalent exists and reads better — but note some loanwords are
already fully naturalized and should NOT be forced back into Indonesian ("digital,"
"startup," "platform" read as native vocabulary at this point, not as a tell).

## Vague attribution

"Para ahli," "beberapa sumber," "studi menunjukkan," "menurut berbagai penelitian"
with nothing named. Replace with a real, specific source ("Sebuah studi dari
University of Pennsylvania (2023) menemukan bahwa...") or drop the attribution
entirely and state the claim plainly — never invent the specific source to replace
the vague one.

## Filler openers

"Perlu diketahui bahwa," "penting untuk dicatat bahwa," "perlu dipahami bahwa,"
"dalam konteks ini," "pada dasarnya," "sejatinya" — these add nothing before the
actual point; cut them.

## Promotional/advertising language

inovatif, revolusioner, terdepan, mutakhir, canggih, memukau, luar biasa,
mengagumkan, terbaik di kelasnya, world-class — AI struggles to hold a neutral tone
specifically around technology, business, and cultural topics in Indonesian.

## Sentence-pattern habits

**Negative parallelism**: "tidak hanya X, tetapi juga Y" — usually more directly
stated as a single clause.

**Excessive passive voice**: "di-" constructions used even where an active sentence
would read more directly and naturally — "Data dikumpulkan dari berbagai sumber,
kemudian dianalisis oleh tim peneliti" reads colder and more structured than "Tim
peneliti mengumpulkan data dari berbagai sumber, menganalisisnya."

**The forced rule of three**: "kemudahan, kecepatan, dan keandalan" — let the actual
content decide the count.

**Overused transitions**: selain itu, di sisi lain, lebih lanjut, sehubungan dengan hal
tersebut — reflexive use across several consecutive sentences is the tell, not a
single instance.

**Signposting/announcement instead of doing**: "Mari kita telaah," "Yuk kita lihat,"
"Tanpa basa-basi lagi" — cut the announcement and start with the content.

**Significance inflation**: menandai babak baru, menjadi tonggak, mencerminkan tren
yang lebih luas, membuka jalan bagi, menggarisbawahi pentingnya.

**Generic optimistic conclusions**: "Dengan demikian, kita dapat menyimpulkan..." /
"Ke depannya, diharapkan..." with no specific claim — close instead with a concrete
fact, a stated next step, or a real number.

**Over-hedged sentences**: "mungkin bisa berpotensi memberikan dampak yang cukup
signifikan" — collapse layered hedges into one clear claim.

**Long, over-layered sentences**: multiple clauses chained together into one sentence
that's hard to parse. Break into shorter, direct sentences.

**Persuasive-authority filler**: "Pertanyaan sesungguhnya adalah," "pada intinya,"
"sejatinya," "yang terpenting adalah" — a staged reveal that the following sentence
usually doesn't earn; state the point directly instead.

## Formatting

**Dash overuse**: a hyphen used repeatedly to insert a clause mid-sentence, similarly
to English em-dash overuse — "Aplikasi ini - yang dikembangkan sejak 2020 - kini
tersedia..." Replace with a comma, a period, or two sentences.

**Chatbot residue**: "Semoga bermanfaat!," "Jangan ragu untuk bertanya," "Tentu saja!,"
"Berikut adalah..." left in delivered content.

## Slang density — for casual/social register specifically

Casual Indonesian legitimately uses contractions and slang, but AI-generated "casual"
Indonesian tends toward one of two failure modes: either it stays formally stiff while
claiming to be casual, or it overcorrects into "over-gaul" — slang piled on so densely
that it reads as a brand account cosplaying as a young person, which is its own
distinct tell from generic AI stiffness.

- **Ordinary contractions are fine and expected in casual register**: gak/nggak, bgt
  (banget), skrg, blm (belum), udh/uda (sudah), gmn (gimana), kyk (kayak), jd (jadi).
  Use them naturally, not in every single word.
- **Heavier slang/English youth-slang terms should be a light accent, not a base
  register**: slay, no cap, rizz, flex, based, vibe, chill, glow up, relatable, POV,
  santuy — cap this at roughly 1–2 per paragraph. More than that reads as cringe, not
  as natural youth voice.
- **Watch for slang that doesn't match the audience or era**: terms from a distinctly
  younger internet subculture (skibidi, sigma, ohio, gyatt) dropped into content for a
  general or professional audience reads as absurd, not relatable — match the slang's
  actual subculture and generation to the content's real audience.
- **Pick one pronoun register and hold it**: aku/kamu/kalian (warmer, more common
  default) or gue/lo (explicitly "street"/Jakarta-casual register) — never mix both in
  one piece.
- **For text-to-speech or spoken content specifically**: write numbers out as they're
  spoken ("dua puluh lima juta," not "25.000.000"), since a TTS engine reads digits
  literally rather than the way a person would say them aloud, and remove emoji
  entirely since a TTS engine can't voice them.

### Opener rotation and pre-flight carve-out

Conjunction openers: Tapi, Dan, Jadi, Namun. Bapak/Ibu-formal openers kept;
Anda-stiff vs kamu-intimate pickup is contextual — flag mismatches, don't
normalize to one. Pre-flight carve-out: none confirmed — universal pre-flight
applies; native review may add one.

## Register table

| Register | Copula ("merupakan") tolerance | Passive voice | Slang density | English loanwords |
|---|---|---|---|---|
| Formal (academic, official, corporate) | None — always "adalah" or restructure | Acceptable where genuinely impersonal | None | Only fully naturalized terms (digital, platform) |
| Semi-formal (blog, media, educational) | Low | Prefer active | Minimal | Naturalized terms only |
| Casual/conversational (social, messaging) | Low | Prefer active | 1–2 heavier slang terms per paragraph max; ordinary contractions freely | Naturalized terms freely, heavier youth slang as accent only |

## Worked example

**Before:**
> Dalam rangka meningkatkan kualitas layanan yang komprehensif, platform inovatif kami
> merupakan solusi revolusioner yang sangat penting bagi para pelaku usaha. Tidak hanya
> menghemat waktu, tetapi juga meningkatkan efisiensi secara keseluruhan.

**After:**
> Platform kami membantu pelaku usaha mengelola operasional dari satu tempat. Tidak
> perlu berpindah-pindah antara spreadsheet, WhatsApp, dan aplikasi kasir.

**Changes:** the copula avoidance ("merupakan solusi revolusioner"), the high-
frequency AI vocabulary cluster ("komprehensif," "inovatif," "revolusioner," "sangat
penting"), and the negative parallelism ("tidak hanya... tetapi juga...") were all
removed; replaced with the specific, concrete thing the platform actually does.

## Sources

`similar-github-projects/by-language/id/humanizer-id-2` — the register-gate, copula-
avoidance, and general pattern catalog this file draws on most; `humanizer-id-3` — the
data-backed slang-density and register-of-address rules for casual/social/TTS content,
built on a real 520-entry slang lexicon rather than assumption. A third repo,
`humanizer-id-1`, exists in the same folder for further cross-checking.
