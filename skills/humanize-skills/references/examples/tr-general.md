# tr-general — golden fixtures

> **Status: model-authored, unreviewed.** Regression tripwire, not a validated gold
> standard or a coverage guarantee — see `README.md` › Validation status. Any
> change-magnitude percentage below is a rough eyeball estimate, not measured (no scanner).


`--general`, Turkish. `tr.md` two-phase model: Phase 1 (unconditional removal, incl.
the five absolute bans) then Phase 2 (register-gated rhythm). These cases are
analytical/journalistic and essay/blog register — distinct from `tr.md`'s own
low-code worked example.

---

## Case 1 — bureaucratic explanatory paragraph, edit warranted

**Setup:** "Bunu daha az yapay zeka yazmışı gibi yap, --general." Register:
analitik/gazete.

**Input:**
> Bu bağlamda, uzaktan çalışma modeli günümüz şirketleri için kritik bir rol
> oynamaktadır. Söz konusu model yalnızca maliyetleri düşürmekle kalmaz; aynı zamanda
> kurumsal kültürü de köklü biçimde dönüştürür — ki bu da çalışan memnuniyetini artırır.
> Uzmanlara göre bu eğilim geri döndürülemezdir. Kesin olan tek şey şudur: işin
> geleceği esnektir. Bu doğrultuda, birçok kurum bu modele yönelmektedir.

**Expected decisions:**
- **Absolute ban 2 (semicolon):** "düşürmekle kalmaz; aynı zamanda" — split into two
  sentences. `tr.md`.
- **Absolute ban 1 (em dash mid-sentence):** "— ki bu da…" — remove; split or use a
  comma. `tr.md`.
- "Bu bağlamda" / "Söz konusu" / "Bu doğrultuda" — bureaucratic connective stacking
  (3+ in one piece), `tr.md` dominant signal. Cut.
- "kritik bir rol oynamaktadır" — closing cliché, `tr.md`. Also "-maktadır/-mektedir"
  appears 3× ("oynamaktadır", "dönüştürür"… "yönelmektedir") — reflexive predicate
  ending, `tr.md` (cluster). Vary the tense.
- "yalnızca … düşürmekle kalmaz; aynı zamanda … dönüştürür" — the "Sadece X değil, aynı
  zamanda Y" family; `tr.md` says **one instance is enough to flag**. State directly.
- "Uzmanlara göre" — vague sourcing, `tr.md` (abstract claims with no concrete anchor)
  + `core-rules.md` §1.2. Name a source or drop it.
- "Kesin olan tek şey şudur: işin geleceği esnektir" — the "şudur/budur" explanation
  formula (calque of "The thing is:"), `tr.md`. Rewrite as "Y olan X", and it's also a
  stated thesis (`structural-pass.md` check 1) — likely just cut.
- Phase 2 (analytical register): sentence-length variance applied; colloquial
  connectives replace bureaucratic ones; no rhetorical questions; no voice profile
  unless offered.
- Fact-lock: no source, no figures → flag, don't invent.
- Change magnitude: ~60%. No-edit gate: passed.

**Reference "after":**
> Uzaktan çalışma, şirketlerde işlerin nasıl koordine edildiğini değiştirdi. Daha çok
> yazışma, daha az toplantı, bir de herkesin aynı anda çevrimiçi olduğu iki saati
> bulma derdi. Bunun verimliliğe yansıyıp yansımadığı ekibe ve işin türüne göre
> değişiyor.
> *("Uzmanlara göre" çıkarıldı: kaynak belirtilmemişti, uydurulmadı.)*

**Blind forced-choice answer key:** a judge picks the **Input** — the semicolon, the
mid-sentence em dash, "Bu bağlamda / Söz konusu / Bu doğrultuda", "kritik bir rol
oynamaktadır", "yalnızca … kalmaz; aynı zamanda …", and "Kesin olan tek şey şudur:" are
textbook Turkish-AI. The reference-after varies sentence length and ends on "değişiyor".

**A regression here looks like:** the semicolon or the mid-sentence em dash survives
(absolute-ban failure); a sentence fragment is introduced (ban 3); "Sadece… aynı
zamanda…" stays; a comma appears before "ancak/ama" (ban 5); "Uzmanlara göre" gets a
fabricated source; or every predicate is still "-maktadır".

---

## Case 2 — already-human essay paragraph, NO EDIT

**Setup:** "Bu paragrafı biraz doğallaştırır mısın? --general." Register: deneme/blog.

**Input:**
> Bahçeyi nisanda kurdum, geç oldu, çünkü martta taşınmayla uğraşıyordum. Domatesler
> cılız kaldı, pazılar üç haftada çiçeğe durdu. Seneye ya daha erken yaparım ya hiç
> yapmam. Biberiye niye kurudu hâlâ anlamış değilim, hemen yanındaki gayet iyiyken.

**Expected decisions:**
- Real sentence-length variation. Colloquial connectives ("çünkü", "ya… ya…"). Devrik
  cümle at the end ("Biberiye niye kurudu hâlâ anlamış değilim, hemen yanındaki gayet
  iyiyken") — `tr.md` notes natural Turkish uses inverted order occasionally and AI
  Turkish essentially never does, so this is a **human signal**. Concrete detail
  (nisan, mart, üç hafta). An unresolved observation.
- None of the five absolute bans is violated: no em dash, no semicolon, no fragment, no
  stranded-conjunction sentence, no comma before a contrast conjunction.
- No bureaucratic connectives, no "-maktadır", no "Sadece… aynı zamanda…", no closing
  cliché.
- No-edit gate: **triggered.** Correct output is no change — in particular, do **not**
  "fix" the devrik cümle into subject-verb order.
- Change magnitude: 0%.

**Deliberately over-edited version (for the blind pair):**
> Bahçe kurulumunu, mart ayında taşınma sürecinde olmam nedeniyle, nisan ayında
> gerçekleştirdim; dolayısıyla planlanandan geç kalınmış oldu. Domates bitkileri
> yeterince gelişememiş, pazılar ise yalnızca üç hafta içinde çiçeklenmiştir. Gelecek
> yıl süreci daha erken başlatmayı planlamaktayım. Biberiyenin, hemen yanındaki sağlıklı
> bitkiye rağmen kurumasının nedenini hâlâ çözebilmiş değilim.

**Blind forced-choice answer key:** a judge picks the **over-edited version** —
"kurulumunu … gerçekleştirdim", the semicolon, "dolayısıyla", "yeterince gelişememiş",
"çiçeklenmiştir", "başlatmayı planlamaktayım" turn a natural essay voice into
bureaucratic Turkish with a banned semicolon and "-maktayım/-mıştır" endings. The input
is a real person.

**A regression here looks like:** the skill rewrites at all; a semicolon appears;
"kurdum" becomes "gerçekleştirdim"; the devrik cümle gets straightened; or "ya hiç
yapmam" (the real aside) gets cut.
