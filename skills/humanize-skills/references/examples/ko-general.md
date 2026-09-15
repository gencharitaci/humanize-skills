# ko-general — golden fixtures

> **Status: model-authored, unreviewed.** Regression tripwire, not a validated gold
> standard or a coverage guarantee — see `README.md` › Validation status. Any
> change-magnitude percentage below is a rough eyeball estimate, not measured (no scanner).


`--general`, Korean. `ko.md`: verify-before-banning (the reversal lesson), the
injection failure mode, register is **bidirectional** (never upgrade formality),
signature phrases are for removal never insertion.

---

## Case 1 — signature-phrase-heavy column paragraph, edit warranted

**Setup:** "이 글을 AI 티 안 나게 다듬어줘, --general." Genre: 칼럼/블로그.

**Input:**
> 결론적으로, 원격근무는 단순한 트렌드가 아니라 일하는 방식의 혁신적인 전환이다. 이는 비용 절감에
> 의해 이루어질 뿐 아니라, 조직 문화 자체를 바꾼다. 규제가 필요한가, 자율에 맡겨야 하는가. 전문가들에
> 따르면 이 흐름은 되돌릴 수 없다. 중요한 것은 속도가 아니라 방향이다. 이것이 바로 원격근무가 미래인
> 이유다.

**Expected decisions:**
- "결론적으로" (opener) — reflexive summary opener, `ko.md` D-category. Remove.
- "단순한 트렌드가 아니라 … 전환이다" + "규제가 필요한가, 자율에 맡겨야 하는가" — antithesis
  pileup ("A가 아니라 B" / "A인가, B인가"), `ko.md` — the single strongest measured
  signal. **Keep at most one**, rewrite the rest as asymmetric direct statements; do
  **not** wipe the pattern out entirely.
- "혁신적인" — hype adjective, `ko.md` D-category. Cut.
- "비용 절감에 의해 이루어질" — by-passive calque ("~에 의해"), `ko.md` translation-ese.
  Restore the agent as subject.
- "~뿐 아니라" — connective overuse candidate; here it's part of the antithesis stack,
  fold into the rewrite.
- "전문가들에 따르면" — vague sourcing, `ko.md` + `core-rules.md` §1.2. Name it or drop it.
- "중요한 것은 속도가 아니라 방향이다" — the cleft-sentence formula ("중요한 것은 ~이다",
  borrowed from "what matters is…"), `ko.md` D-category. Collapse to a direct
  subject-predicate statement — and it's another antithesis ("A가 아니라 B"), reinforcing
  the pileup.
- "이것이 바로 원격근무가 미래인 이유다" — inverted causal closer ("~하는 이유다"), `ko.md`
  D-category — and one of the forms **directly measured being injected** by polishing
  passes. Remove; never re-introduce a version of it.
- Register: input is 해라체/문어체 declarative — keep that register, don't shift it.
- Fact-lock: no source, no numbers → flag, don't invent.
- Injection check (`ko.md` + `core-rules.md` §6): after rewriting, confirm the edit did
  not add a comma after a connective ending or a new "~하는 이유다"-type closer.
- Change magnitude: ~55%. No-edit gate: passed.

**Reference "after":**
> 원격근무는 이제 트렌드라기보다 기본값에 가깝다. 사무실 비용이 줄어드는 것도 있지만, 더 크게는
> 팀이 일을 맞추는 방식이 달라진다 — 문서로 남기는 일이 늘고, 회의가 줄고, 시차를 두고 겹치는
> 시간을 잡느라 품이 든다. 생산성 숫자가 실제로 오르는지는 팀과 일의 종류에 따라 다르다.
> *(원문의 "전문가들에 따르면"은 뺐다. 구체적 출처가 없어서 지어내지 않았다. 대조 구문은 첫 문장
> 하나만 남기고 나머지는 직접 서술로 풀었다.)*

**Blind forced-choice answer key:** a judge picks the **Input** — "결론적으로",
the stacked "A가 아니라 B" / "A인가, B인가" antithesis, "혁신적인", "~에 의해", "중요한
것은 ~이 아니라 ~이다", and "~인 이유다" are a dense D-category + antithesis cluster.
The reference-after keeps exactly one contrast and states the rest directly.

**A regression here looks like:** every antithesis is deleted (the over-correction
`ko.md` explicitly flags — one should be kept); "~에 의해" survives; a source gets
invented; the register gets pushed more formal; or the rewrite **adds** a "~하는
이유다"-type closer or a comma after a -고/-지만 ending while polishing.

---

## Case 2 — already-human casual post, NO EDIT (and don't upgrade formality)

**Setup:** "이 글 좀 자연스럽게 다듬어줘, --general." Register: casual 해요체.

**Input:**
> 지난주에 회사 빌드를 새 툴로 옮겼는데요, 반나절 걸렸어요. 내보내기는 괜찮은데 가져오기가 진짜
> 느려요. 저장소가 이백 개 넘으니까 세 시간 좀 넘게 걸렸고요. 진작 할걸 그랬어요. 근데 러너 하나가
> 아직도 왜 멈추는지 모르겠네요.

**Expected decisions:**
- Register is casual 해요체 with sentence-final "-는데요/-거든요/-네요". `ko.md`:
  **keep it casual — do not clean it up into a more formal register.** Both directions
  are defects.
- Concrete detail (지난주, 반나절, 이백 개, 세 시간). Particles of life ("진짜", "근데",
  "-네요"). An open question at the end. Real short/long variation.
- No signature phrases, no antithesis pileup, no "~에 의해", no vague sourcing, no
  cleft formula, no causal closer.
- No-edit gate: **triggered.** Correct output is no change.
- Change magnitude: 0%.

**Deliberately over-edited version (for the blind pair):**
> 지난주 회사 빌드 시스템을 새로운 도구로 이전하였다. 소요 시간은 반나절이었다. 내보내기는 원활하게
> 완료되었으나, 가져오기는 상당한 시간이 소요되어 200개가 넘는 저장소를 이전하는 데 세 시간 이상이
> 걸렸다. 보다 일찍 진행했어야 했다. 다만 특정 러너가 여전히 중단되는 원인은 아직 파악되지 않았다.

**Blind forced-choice answer key:** a judge picks the **over-edited version** — it
shifted 해요체 → 문어체 "-이었다/-되었다/-걸렸다", "이전하였다", "원활하게 완료되었으나",
"소요되어", "파악되지 않았다". That formality upgrade is exactly the bidirectional-register
defect `ko.md` names. The input is a real casual post.

**A regression here looks like:** the skill rewrites at all; 해요체 becomes 문어체;
"옮겼는데요" becomes "이전하였다"; "모르겠네요" becomes "파악되지 않았다"; or the casual
particles are stripped.
