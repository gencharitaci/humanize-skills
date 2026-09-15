# it-general — golden fixtures

> **Status: model-authored, unreviewed.** Regression tripwire, not a validated gold
> standard or a coverage guarantee — see `README.md` › Validation status. Non-English:
> needs a native-speaker check.

`--general`, Italian. `it.md`: AI Italian's core failure is **excess of ornatus**
(*mala affectatio*) — periphrasis, forced triads, gerundite. The **control-level gate**
decides typography: uncontrolled text (web/social/chat) keeps keyboard conventions and
they are **not** errors to fix.

---

## Case 1 — mala affectatio paragraph, edit warranted

**Setup:** "Riscrivi questo in modo che sembri meno scritto da un'IA, --general."
Control level: controlled (a blog article).

**Input:**
> Nel contesto attuale, la trasformazione digitale si configura come una leva
> fondamentale per ogni azienda, rappresentando non semplicemente un cambiamento
> tecnologico, ma un vero e proprio cambio di paradigma. Il nostro strumento,
> realmente innovativo e completo, permette di ottimizzare ogni processo, garantendo
> risultati eccellenti e migliorando sensibilmente l'efficienza. Secondo gli esperti,
> il futuro appare promettente.

**Expected decisions:**
- "Nel contesto attuale" — gray preamble / dictionary-style opener, `it.md` (*dispositio*).
- "si configura come" + "rappresentando" — copula avoidance (periphrasis), `it.md`
  *ornatus*. → "è".
- "una leva fondamentale" + "realmente innovativo e completo" + "risultati eccellenti"
  — pompous adjectives / *mala affectatio*, `it.md`. Aim one register below.
- "non semplicemente un cambiamento tecnologico, ma un vero e proprio cambio di
  paradigma" — the **bipolar definition** (*non è X, ma Y*). `it.md`: cut to a pure
  assertion **when ornamental** — here it's copy-style elevation carrying no
  information, so cut it.
- "permette di ottimizzare" + "effettuare"-family — *antilingua*: prefer the common
  word / full verb. "ottimizzare ogni processo" says nothing concrete.
- "garantendo … migliorando …" — gerundite (at most one trailing gerund per paragraph),
  `it.md`. Direct sentences.
- "sensibilmente" — -mente adverb the sentence holds up without, `it.md`.
- "Secondo gli esperti" — vague attribution + the fact-checking guard, `it.md`. Name a
  source or drop it; never invent one.
- "il futuro appare promettente" — inflated close, `it.md` (*dispositio*: close on a
  sober summary or a real question).
- Conservation contract: no facts/numbers in the source → placeholder *[dato da
  verificare]*, never an invented figure.
- Change magnitude: ~65% (eyeballed). No-edit gate: passed.

**Reference "after":**
> Il nostro strumento raccoglie in un posto solo quello che oggi è sparso tra foglio
> di calcolo, chat e gestionale di cassa. In pratica elimina il lavoro di riscrivere
> due volte la stessa informazione. *(Tolta la frase "Secondo gli esperti…": nessuna
> fonte era citata e non se ne inventa una.)*

**Blind forced-choice answer key:** a judge picks the **Input** — "Nel contesto
attuale", "si configura come una leva fondamentale", "non semplicemente X, ma Y",
"garantendo … migliorando …", and "il futuro appare promettente" are a stack of
*mala affectatio*. The reference-after uses common words and states one concrete effect.

**A regression here looks like:** "si configura come" / "rappresenta" survive; the
ornamental bipolar definition is kept; more than one trailing gerund remains;
"effettuare"/"ottimizzare" stay where a plain verb fits; "Secondo gli esperti" gets a
fabricated citation; or an *informational* "non è X, ma Y" elsewhere gets flattened
(over-correction `it.md` warns against — fidelity beats cleanliness).

---

## Case 2 — uncontrolled (social) text with keyboard conventions, NO EDIT

**Setup:** "Sistema un attimo questo commento, --general." Control level: **uncontrolled**
(the keyboard-convention signals — `perche`, `pero'`, all-lowercase — settle it).

**Input:**
> settimana scorsa ho spostato la build sul tool nuovo, ci ho messo mezza giornata.
> export ok, l'import lentissimo pero' - piu di 200 repo, quasi tre ore. dovevo farlo
> prima ma si rimanda sempre. c'e' un runner che continua a piantarsi e non ho ancora
> capito perche.

**Expected decisions:**
- `it.md` control-level gate: consistent keyboard-convention signals (`pero'`, `c'e'`,
  `perche` without the accent, all-lowercase) → **uncontrolled**. Keyboard accent
  substitutes and absent capitals are **not errors to fix** here; imposing editorial
  typography would itself be an *aptum* violation.
- Concrete detail (settimana scorsa, mezza giornata, 200 repo, tre ore). A self-aware
  aside. An open question. Real sentence-length variation.
- The single ` - ` between two short clauses is a hyphen used casually in an
  uncontrolled register — `it.md` says the em dash is not used in Italian and
  uncontrolled text has "no em dash"; a casual hyphen here is within convention, not a
  tell to hunt.
- No periphrasis, no forced triad, no gerundite, no vague attribution, no inflated close.
- No-edit gate: **triggered.** Correct output is no change — do not fix `perche` →
  `perché`, do not capitalize, do not convert `pero'` → `però`.
- Change magnitude: 0%.

**Deliberately over-edited version (for the blind pair):**
> La settimana scorsa ho effettuato lo spostamento della build sul nuovo strumento,
> operazione che ha richiesto mezza giornata. L'esportazione si è svolta senza
> problemi, mentre l'importazione si è rivelata particolarmente lenta: oltre 200
> repository hanno richiesto quasi tre ore. Si tratta di un'attività che avrei dovuto
> svolgere prima; tuttavia, il rinvio è una tendenza comune. Resta da chiarire il
> motivo per cui uno dei runner continua a bloccarsi.

**Blind forced-choice answer key:** a judge picks the **over-edited version** — it
"corrected" the register upward (full accents, capitals, «senza problemi», "ho
effettuato lo spostamento", "Si tratta di un'attività che…", the injected semicolon),
which is an *aptum* violation on a social comment plus *antilingua* (*effettuare*). The
input is a real comment.

**A regression here looks like:** the skill rewrites at all; `perche` becomes `perché`
or the text gets capitalized/typographically normalized; "ho spostato … ci ho messo
mezza giornata" becomes "ho effettuato lo spostamento … operazione che ha richiesto";
or "si rimanda sempre" becomes "il rinvio è una tendenza comune".
