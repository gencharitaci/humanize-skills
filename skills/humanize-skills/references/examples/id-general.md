# id-general — golden fixtures

> **Status: model-authored, unreviewed.** Regression tripwire, not a validated gold
> standard or a coverage guarantee — see `README.md` › Validation status. Non-English:
> also needs a native-speaker check of both the slop input and the reference "after".

`--general`, Indonesian. `id.md`: confirm register first (formal / semi-formal /
casual) and hold it — register drift is one of the clearest AI tells in Indonesian.
Highest-priority single tell: copula avoidance ("merupakan" for "adalah").

---

## Case 1 — semi-formal blog paragraph, edit warranted

**Setup:** "Tolong tulis ulang biar nggak kaku kayak AI, --general." Register:
semi-formal (blog).

**Input:**
> Perlu diketahui bahwa di era digital saat ini, komunikasi yang efektif merupakan
> kunci keberhasilan bagi setiap tim. Platform kami merupakan solusi inovatif dan
> komprehensif yang tidak hanya menghemat waktu, tetapi juga meningkatkan efisiensi
> secara signifikan. Menurut berbagai penelitian, tim yang terhubung dengan baik
> cenderung lebih produktif. Yuk kita telaah lebih dalam. Pada akhirnya, transformasi
> digital adalah keniscayaan.

**Expected decisions:**
- "Perlu diketahui bahwa" + "di era digital saat ini" — filler openers, `id.md`. Cut.
- "komunikasi yang efektif merupakan kunci keberhasilan" + "Platform kami merupakan
  solusi…" — **copula avoidance**, `id.md`'s single highest-priority tell. Restate
  directly and concretely.
- "inovatif dan komprehensif" + "signifikan" — high-frequency AI vocabulary cluster,
  `id.md` (co-occurrence is the signal).
- "tidak hanya … tetapi juga …" — negative parallelism, `id.md`.
- "Menurut berbagai penelitian" — vague attribution, `id.md`. Name a real study or drop
  the claim; never invent the specific source.
- "Yuk kita telaah lebih dalam" — signposting/announcement instead of doing, `id.md`.
  Also a register slip: casual "Yuk" inside otherwise semi-formal prose (register
  inconsistency, `id.md`).
- "Pada akhirnya, transformasi digital adalah keniscayaan" — generic optimistic
  conclusion + stated thesis, `id.md` + `structural-pass.md` check 1.
- Fact-lock: no study, no numbers → flag, don't invent.
- Change magnitude: ~65% (eyeballed). No-edit gate: passed.

**Reference "after":**
> Tim yang jalan biasanya punya komunikasi yang jelas — orang tahu apa yang harus
> dikerjakan dan ke siapa harus bertanya. Platform kami menyatukan itu di satu tempat:
> tugas, update, dan diskusi tidak lagi tersebar di spreadsheet dan grup WhatsApp.
> *(Kalimat "Menurut berbagai penelitian…" dihapus: tidak ada studi yang disebut, dan
> tidak dikarang.)*

**Blind forced-choice answer key:** a judge picks the **Input** — "Perlu diketahui
bahwa", the doubled "merupakan", "inovatif dan komprehensif", "tidak hanya… tetapi
juga…", "Yuk kita telaah lebih dalam", and "Pada akhirnya… adalah keniscayaan" are
textbook AI Indonesian, plus the baku/gaul register slip. The reference-after is
concrete and holds one register.

**A regression here looks like:** "merupakan" survives anywhere it could be "adalah" or
a restructure; the "tidak hanya… tetapi juga…" pair stays; a university/study name gets
invented; the casual "Yuk" is left inside semi-formal prose; or the "keniscayaan"
close is kept.

---

## Case 2 — consistently casual human post, NO EDIT (and don't formalize it)

**Setup:** "Rapihin caption ini dikit, --general." Register: casual/conversational.

**Input:**
> Minggu lalu akhirnya pindahin build ke tool baru, makan waktu setengah hari. Export
> sih aman, import-nya yang lama banget — 200-an repo jalan hampir tiga jam. Harusnya
> dari dulu, cuma males aja. Tinggal satu runner yang masih suka nyangkut, belum
> ketemu kenapa.

**Expected decisions:**
- Register is **consistently casual**: "sih", "banget", "males aja", "nyangkut",
  clipped "200-an", "harusnya dari dulu". `id.md`: hold the register — do **not**
  formalize it. Register drift *toward* baku is as much a defect as drift toward gaul.
- Ordinary contractions only, no heavy youth-slang pile-up — within `id.md`'s casual
  guidance (contractions freely, heavier slang as a light accent).
- Concrete detail (minggu lalu, setengah hari, 200-an repo, hampir tiga jam). A self-
  aware aside ("cuma males aja"). An open problem at the end.
- No "merupakan", no filler opener, no vague attribution, no signposting, no optimistic
  conclusion.
- No-edit gate: **triggered.** Correct output is no change.
- Change magnitude: 0%.

**Deliberately over-edited version (for the blind pair):**
> Pada minggu lalu, kami akhirnya melakukan migrasi sistem build ke sebuah tool baru,
> yang memakan waktu setengah hari. Proses ekspor berjalan dengan aman, sementara
> proses impor merupakan bagian yang memakan waktu paling lama — sekitar 200 repositori
> membutuhkan waktu hampir tiga jam. Hal ini seharusnya dilakukan lebih awal. Saat ini,
> masih terdapat satu runner yang mengalami kendala, dan penyebabnya belum
> teridentifikasi.

**Blind forced-choice answer key:** a judge picks the **over-edited version** — it
shifted casual → formal ("melakukan migrasi", "Proses ekspor berjalan dengan aman",
"merupakan bagian yang…", "belum teridentifikasi"), reintroducing the exact "merupakan"
tell and the register drift `id.md` names. The input is a real caption.

**A regression here looks like:** the skill rewrites at all; casual becomes baku;
"pindahin" becomes "melakukan migrasi"; "males aja" becomes "belum menjadi prioritas";
"belum ketemu kenapa" becomes "belum teridentifikasi"; or "merupakan" appears.
