# vi-general — golden fixtures

> **Status: model-authored, unreviewed.** Regression tripwire, not a validated gold
> standard or a coverage guarantee — see `README.md` › Validation status. Non-English:
> also needs a native-speaker check of both the slop input and the reference "after".

`--general`, Vietnamese. `vi.md` genre gate: **administrative is the default**; general
content (blog/marketing/script) activates only when the requester says so or the text
is clearly not administrative. The ≥2-signal over-edit guard applies before anything.

---

## Case 1 — place/culture blog paragraph, edit warranted

**Setup:** "Viết lại đoạn này cho bớt giống AI, --general." The requester's flag plus
the travel-blog content activates **general content** register (not administrative).

**Input:**
> Nằm nép mình bên dòng sông thơ mộng, thành phố cổ kính này là một điểm đến không thể
> bỏ qua, mang trong mình bề dày lịch sử phong phú và đa dạng. Không chỉ chinh phục du
> khách bởi vẻ đẹp hùng vĩ, nơi đây còn khẳng định vị thế là một trung tâm văn hóa quan
> trọng, qua đó góp phần thúc đẩy sự phát triển du lịch của cả khu vực.

**Expected decisions:**
- "Nằm nép mình bên dòng sông thơ mộng" + "thành phố cổ kính này là một điểm đến…" —
  encyclopedic-definition opening + flowery place-writing language (thơ mộng, hùng vĩ,
  phong phú và đa dạng), `vi.md` (a tell **especially for place/culture topics**).
- "là một điểm đến không thể bỏ qua" — significance inflation, `vi.md`.
- "Không chỉ … còn …" — negative-symmetry overuse, `vi.md`.
- "khẳng định vị thế" + "qua đó góp phần thúc đẩy" — hollow tail clauses faking depth,
  `vi.md`.
- "sự phát triển" — machine-translation "sự + X" nominalization, `vi.md`. Prefer a
  direct verb.
- ≥2-signal guard: every sentence here carries 2+ signals, so rewriting is warranted;
  a sentence with one isolated signal + a concrete fact would be left alone.
- Fact-lock: no founding date, population, or named site in the source → cannot add
  one; if a concrete anchor is wanted, leave `[cần bổ sung số liệu]`.
- Change magnitude: ~65% (eyeballed). No-edit gate: passed.

**Reference "after":**
> Thành phố nằm bên sông và có một khu phố cổ. Bản nháp gốc chỉ toàn tính từ ("thơ
> mộng", "hùng vĩ", "phong phú và đa dạng") mà không có một dữ kiện nào: không năm,
> không tên công trình, không con số. Phần mô tả thật (có gì đáng xem, quy mô, lịch sử)
> phải lấy từ nguồn thực tế, không suy diễn: `[cần bổ sung nội dung cụ thể]`.

**Blind forced-choice answer key:** a judge picks the **Input** — "Nằm nép mình bên
dòng sông thơ mộng", "không thể bỏ qua", "hùng vĩ", "Không chỉ … còn …", "qua đó góp
phần thúc đẩy" is stacked travel-brochure AI Vietnamese. The reference-after strips the
adjectives to the one plain fact the draft contained and flags the rest as missing.

**A regression here looks like:** flowery vocabulary (thơ mộng / hùng vĩ) survives; the
"Không chỉ… còn…" pair stays; a founding year, a visitor number, or a specific site
(a museum, a temple by name) gets invented instead of a `[cần bổ sung]` placeholder; or
the encyclopedic "X là một…" opening is kept.

---

## Case 2 — already-human casual note, NO EDIT

**Setup:** "Chỉnh lại đoạn này cho tự nhiên hơn, --general."

**Input:**
> Tuần trước chuyển hệ thống build sang công cụ mới, mất cả buổi chiều. Xuất thì ổn,
> nhập mới lâu — hơn 200 repo chạy gần ba tiếng. Đáng ra làm sớm hơn rồi, tại lười.
> Có mỗi cái runner không hiểu sao vẫn treo, chưa tìm ra nguyên nhân.

**Expected decisions:**
- Concrete detail (tuần trước, cả buổi chiều, hơn 200 repo, gần ba tiếng). A self-
  critical aside ("tại lười"). An open problem at the end. Real short/long variation.
- The one ` — ` here sits between two short clauses in casual prose; it is a **single**
  signal at most, and the sentence also carries a concrete fact ("hơn 200 repo") — the
  ≥2-signal guard says leave it. `vi.md` also lists a lone hyphen in casual writing as
  not-a-tell.
- No significance inflation, no flowery language, no hollow tail clauses, no
  encyclopedic opening.
- No-edit gate: **triggered.** Correct output is no change.
- Change magnitude: 0%.

**Deliberately over-edited version (for the blind pair):**
> Vào tuần trước, chúng tôi đã tiến hành việc chuyển đổi hệ thống build sang một công
> cụ mới, quá trình này mất khoảng một buổi chiều. Việc xuất dữ liệu diễn ra thuận lợi,
> trong khi đó thì việc nhập dữ liệu lại tương đối chậm, với hơn 200 kho lưu trữ mất
> gần ba giờ đồng hồ. Đáng lẽ ra công việc này nên được thực hiện sớm hơn. Hiện tại,
> nguyên nhân khiến một runner vẫn bị treo vẫn đang được xác định.

**Blind forced-choice answer key:** a judge picks the **over-edited version** —
"đã tiến hành việc chuyển đổi", "quá trình này", "trong khi đó thì" (a flagged
MT-syntax calque), "vẫn đang được xác định" turn a casual note into nominalized report
Vietnamese. The input is untouched.

**A regression here looks like:** the skill rewrites at all; "chuyển … mất cả buổi
chiều" becomes "tiến hành việc chuyển đổi … quá trình này mất khoảng"; the ` — ` gets
"fixed" as if it were the drama-pause pattern; or "tại lười" (the real aside) is cut.
