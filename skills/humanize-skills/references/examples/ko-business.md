# ko-business — golden fixtures

> **Status: model-authored, unreviewed.** Regression tripwire, not a validated gold
> standard or a coverage guarantee — see `README.md` › Validation status. Non-English:
> needs a native-speaker check.

`--business`, Korean. The crossing: `business.md` wants every claim to carry an owner, a
date, or a number, and caps register on sensitive comms; `ko.md` says **never upgrade
formality** (keep the input's 체), keep **one** antithesis (not zero), run the injection
check, and don't insert D-category signature phrases.

---

## Case 1 — AI Korean status update to leadership, edit warranted

**Setup:** "경영진 보고용으로 이 업데이트 다듬어줘, --business." Input register: 하십시오체.

**Input:**
> 결론적으로, 이번 분기 우리 팀은 조직 전반의 큰 가치를 창출하고 성장을 이끄는 데 집중했습니다.
> 이것은 단순한 개선이 아니라 혁신적인 전환입니다. 제품팀과의 시너지는 그 어느 때보다 강력하며,
> 이러한 모멘텀에 의해 앞으로 사업이 크게 도약할 것으로 확신합니다. 참여도 또한 폭발적으로
> 증가했습니다. 결국 이것이 우리가 승리하는 이유입니다.

**Expected decisions:**
- "결론적으로" (opener) + "결국 이것이 우리가 승리하는 이유입니다" (closer) — reflexive
  summary opener + inverted causal closer ("~하는 이유다"), `ko.md` D-category. Remove
  both. The closer is also one of the forms **measured being injected** by polishing —
  never re-add a version of it.
- "큰 가치를 창출하고 성장을 이끄는 데 집중했습니다" — unaccountable impact claim, `business.md`.
  No owner, no date, no number. Replace with the specific initiative + result, or flag
  what's missing.
- "단순한 개선이 아니라 혁신적인 전환입니다" — antithesis ("A가 아니라 B"), `ko.md`. This is
  the **one** antithesis in the piece — `ko.md` says keep one, rewrite the rest
  asymmetric. Here, though, it's a hollow significance claim ("혁신적인 전환"), so cut it
  as content, not as pattern: `business.md` "a promise can't get bigger because the
  language got louder."
- "혁신적인" — hype adjective, `ko.md` D-category.
- "시너지는 그 어느 때보다 강력하며" — unfalsifiable superiority claim, `business.md`.
- "이러한 모멘텀에 의해 … 도약할 것으로 확신합니다" — "~에 의해" by-passive calque (`ko.md`)
  + significance inflation ("도약", `business.md`).
- "참여도 또한 폭발적으로 증가했습니다" — a metric with no number, no baseline, no
  definition of "참여도", `business.md` (vanity metric / metric without its partner).
  Flag for the real figure.
- **Register:** input is 하십시오체 — `ko.md`: **keep it**. Do not shift to 해요체 or to
  문어체 "-이다".
- Injection check (`ko.md` + `core-rules.md` §6): after editing, confirm no comma was
  added after a -고/-며 ending and no "~하는 이유다"-type closer was reintroduced.
- Fact-lock: no numbers, owners, or dates → cannot add them; flag what's missing.
- Change magnitude: ~65% (eyeballed). No-edit gate: passed.

**Reference "after":**
> 이번 분기 진행 상황입니다.
>
> - [이니셔티브 A]와 [이니셔티브 B]를 배포했고, [이니셔티브 C]는 [의존성] 때문에 4분기로
>   밀렸습니다.
> - "참여도"(주간 활성 계정 기준)는 [X]에서 [Y]로 움직였습니다. 보고 가능한 확정 수치는 분석팀에서
>   받아야 합니다.
> - 경영진 판단이 필요한 사항: [이니셔티브 D] 인력을 지금 배치할지, 4분기 계획 이후로 미룰지.
> *(원문의 "큰 가치 창출", "폭발적 증가" 등은 담당자·날짜·수치가 없어 구체 항목으로 바꾸거나
> 빠진 부분을 표시했습니다. 없는 숫자는 만들지 않았습니다.)*

**Blind forced-choice answer key:** a judge picks the **Input** — "결론적으로",
"단순한 개선이 아니라 혁신적인 전환", "시너지는 그 어느 때보다 강력", "~에 의해 … 도약할
것으로 확신", "폭발적으로 증가", "우리가 승리하는 이유입니다" are a dense D-category +
unaccountable-claim stack. The reference-after has blocked items and open questions,
which reads like a real update.

**A regression here looks like:** "결론적으로" or a "~하는 이유다" closer survives (or a new
one is injected); "혁신적인 전환" / "도약" significance language stays; "참여도 폭발적 증가"
is kept without a number, or a number gets invented; "~에 의해" survives; or the register
gets shifted (하십시오체 → 해요체 or → 문어체).

---

## Case 2 — correct Korean business email, NO EDIT (and don't change the 체)

**Setup:** "이 메일 자연스럽게 다듬어줘, --business." Input register: 하십시오체.

**Input:**
> 지난주 빌드 시스템을 새 도구로 옮겼습니다. 반나절 걸렸고, 저장소 200여 개 이관에 약 3시간이
> 소요됐습니다. 예상보다 임포트가 느렸습니다. 러너 하나가 아직 간헐적으로 멈추는데, 원인은 이번 주
> 안에 파악해서 다시 공유드리겠습니다.

**Expected decisions:**
- Every claim already carries a number or a commitment: 반나절, 200여 개, 약 3시간, "이번
  주 안에 … 다시 공유드리겠습니다" (owner + date). `business.md`: this is a business
  sentence — nothing to flag.
- Consistent 하십시오체 ("옮겼습니다", "소요됐습니다", "공유드리겠습니다"). `ko.md`: keep it.
- Concrete, direct, no significance inflation, no antithesis, no "~에 의해", no D-category
  phrase, an honest open item with a committed follow-up.
- No-edit gate: **triggered.** Correct output is no change.
- Change magnitude: 0%.

**Deliberately over-edited version (for the blind pair):**
> 결론적으로, 지난주 우리는 빌드 시스템의 성공적인 마이그레이션을 완료했습니다. 이는 단순한 도구
> 교체가 아니라 개발 생산성의 도약입니다. 이관은 순조롭게 진행되었으며, 향후 유사한 이슈는 발생하지
> 않을 것으로 기대됩니다.

**Blind forced-choice answer key:** a judge picks the **over-edited version** — it added
"결론적으로", an antithesis+hype line ("단순한 도구 교체가 아니라 … 도약입니다"), replaced
the concrete numbers with "순조롭게 진행", and swapped the honest open item + dated
commitment for an unsupported "발생하지 않을 것으로 기대됩니다". Every one is a
`business.md` / `ko.md` failure. The input is a correct business email.

**A regression here looks like:** the skill rewrites at all; "결론적으로" or an
antithesis/"도약" line is added; the numbers (반나절 / 200여 개 / 3시간) get abstracted to
"순조롭게"; the dated follow-up commitment is dropped or vagued; or the 체 is changed.
