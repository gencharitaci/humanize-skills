# hi-general — golden fixtures

> **Status: model-authored, unreviewed.** Regression tripwire, not a validated gold
> standard or a coverage guarantee — see `README.md` › Validation status. Non-English:
> needs a native-speaker check. `hi.md` has a single source repo; **Devanagari
> rendering** is a separate open item (roadmap risk note).
>
> **Catalog fix applied (2026-09-06):** `hi.md`'s own worked-example "after" used to
> contain an em dash "—", which the file's own rule ("target zero instances") forbids;
> it was rewritten to a danda-terminated sentence. This fixture's reference-after also
> uses a danda / comma, not an em dash.

`--general`, Hindi. `hi.md`: danda "।" not Latin "."; em dash "—" is foreign (target
zero); register uniformity is a tell in **both** directions (over-Sanskritized vs.
thin Hinglish).

---

## Case 1 — over-Sanskritized slop with Latin periods and an em dash, edit warranted

**Setup:** "इसे कम AI जैसा बनाकर लिखो, --general." Register: semi-formal blog for a
general audience.

**Input:**
> आज के युग में डिजिटल परिवर्तन न केवल व्यवसायों के लिए आवश्यक है, बल्कि यह एक क्रांतिकारी
> अवसर भी है. यह न केवल दक्षता बढ़ाता है, बल्कि लागत भी कम करता है — जो निःसंदेह एक
> गेम-चेंजर है. विशेषज्ञों के अनुसार, यह प्रवृत्ति अपरिवर्तनीय है. अंत में, यह अत्याधुनिक
> समाधान हर कंपनी की क्षमता को अनलॉक कर सकता है.

**Expected decisions:**
- Sentence-final Latin "." on Devanagari sentences — mechanical tell, `hi.md`. Convert
  to danda "।" (this is semi-formal blog, not chat register).
- " — जो निःसंदेह …" — em dash, foreign to Devanagari, `hi.md`. Target zero: replace
  with a danda, comma, or colon.
- "आज के युग में" — generic time-framing opener, `hi.md`. Cut.
- "न केवल X, बल्कि Y भी" used twice — negative-parallelism AI-signature construction,
  `hi.md`. State directly.
- "क्रांतिकारी", "अत्याधुनिक", "निःसंदेह", "क्षमता को अनलॉक कर सकता है", "गेम-चेंजर" —
  suspect vocabulary + EN→hi calque, `hi.md`.
- "विशेषज्ञों के अनुसार" — vague attribution, `hi.md` + `core-rules.md` §1.2. Name a
  source or drop the claim.
- "अंत में, …" opening the close — conclusion template, `hi.md`.
- Register: heavy तत्सम register ("अपरिवर्तनीय", "निःसंदेह") aimed at a general audience
  — register mismatch, `hi.md`. Pull toward plainer Hindi.
- "हर कंपनी की क्षमता को अनलॉक कर सकता है" — substitutable/universal claim; replace with
  a concrete result + an honest scope limit.
- Fact-lock: no numbers/source → flag, don't invent.
- Change magnitude: ~65% (eyeballed). No-edit gate: passed.

**Reference "after":**
> डिजिटल टूल अपनाने से टीम के काम करने का तरीका बदलता है, पर यह हर कंपनी में एक जैसा असर
> नहीं करता। मूल में "दक्षता बढ़ती है", "लागत कम होती है" जैसे दावे हैं पर कोई आंकड़ा नहीं।
> बाहरी सामग्री में डालने से पहले असली आंकड़े चाहिए, यहाँ कोई नहीं गढ़ा गया। "विशेषज्ञों के
> अनुसार" हटाया गया, क्योंकि स्रोत नहीं था।
> *(ध्यान दें: यह "after" खुद em dash और लैटिन पूर्णविराम से बचता है, यानी वही नियम जो इस
> केस में जाँचा जा रहा है।)*

**Blind forced-choice answer key:** a judge picks the **Input** — Latin periods on
Devanagari, the em dash, "आज के युग में", the doubled "न केवल … बल्कि … भी",
"क्रांतिकारी / अत्याधुनिक / गेम-चेंजर", and "अंत में" are recognizable AI Hindi. The
reference-after uses the danda, plain register, and an honest scope limit, and flags
the missing numbers rather than inventing one.

**A regression here looks like:** the em dash survives (or a new one is introduced —
including in the "after" itself); Latin "." is kept on Devanagari sentences; "न केवल …
बल्कि … भी" stays; a statistic, a named expert, or a specific team result gets invented;
the register stays heavily Sanskritized for a general audience; or "अंत में/निष्कर्ष में"
opens the close.

---

## Case 2 — already-human Hinglish casual post, NO EDIT (don't Sanskritize)

**Setup:** "इस पोस्ट को थोड़ा ठीक कर दो, --general." Register: casual/social (Hinglish
code-mixing is appropriate here).

**Input:**
> पिछले हफ्ते आखिरकार build को नए tool पे shift किया, आधा दिन लग गया। Export तो ठीक था,
> import ही slow निकला — 200+ repos को करीब तीन घंटे लगे। पहले ही कर लेना चाहिए था, बस
> आलस था। एक runner अब भी अटक रहा है, समझ नहीं आ रहा क्यों।

**Expected decisions:**
- Register is **consistently casual Hinglish**: build/tool/shift/export/import/slow/
  repos/runner as naturalized loanwords in a casual post. `hi.md`: code-mixing is fine
  in casual register — the tell would be *mismatching* register, not code-mixing
  itself. Do **not** translate the loanwords or Sanskritize the register.
- The danda "।" is used correctly throughout. (The one " — " here is between two short
  casual clauses; `hi.md`'s danda rule notes the Latin period is tolerated in "casual
  chat/messaging register", and this is that register — but the em dash is still worth
  a light swap to a comma. Borderline; not the main point of this case.)
- Concrete detail (पिछले हफ्ते, आधा दिन, 200+ repos, तीन घंटे). A self-aware aside ("बस
  आलस था"). An open problem at the end. Real sentence-length variation.
- No generic opener, no "न केवल … बल्कि", no suspect vocabulary, no vague attribution,
  no conclusion template.
- No-edit gate: **triggered.** Correct output is no change (at most, the one em dash →
  comma; nothing else).
- Change magnitude: 0–3%.

**Deliberately over-edited version (for the blind pair):**
> गत सप्ताह अंततः बिल्ड प्रणाली को नए उपकरण पर स्थानांतरित किया गया, जिसमें आधा दिवस
> लगा। निर्यात प्रक्रिया संतोषजनक रही, जबकि आयात प्रक्रिया अपेक्षाकृत धीमी रही — दो सौ से
> अधिक रिपॉज़िटरी में लगभग तीन घंटे लगे। यह कार्य पूर्व में ही सम्पन्न किया जाना चाहिए था;
> विलंब का कारण मात्र प्रमाद रहा। एक रनर अब भी बाधित हो रहा है, जिसका कारण अज्ञात है।

**Blind forced-choice answer key:** a judge picks the **over-edited version** — it
translated every loanword ("स्थानांतरित", "निर्यात प्रक्रिया", "रिपॉज़िटरी") and forced
a heavy तत्सम register ("गत सप्ताह", "अंततः", "सम्पन्न", "प्रमाद", "अज्ञात है") plus a
semicolon and an em dash onto a casual Hinglish post. That register mismatch is exactly
the `hi.md` tell. The input is a real post.

**A regression here looks like:** the skill Sanskritizes the register or translates
"build/tool/shift/repos/runner"; "आलस था" becomes "प्रमाद रहा"; "समझ नहीं आ रहा क्यों"
becomes "जिसका कारण अज्ञात है"; or a semicolon/new em dash appears.
