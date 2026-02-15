---
name: pr-review
description: Explicit trigger PR review skill. Trigger when user requests $pr-review.
---

# PR-REVIEW SKILL (Global)

Explicit PR review skill.
Runs when explicitly invoked with:

    $pr-review

AI-first, short, and strict.

---

## 🛑 Core Review Principles (最優先レビュー原則)

1. **Correctness First**  
   バグ検出を最優先。

2. **Risk Visibility**  
   破壊的変更や副作用を明確化。

3. **Minimal Fix Bias**  
   最小安全修正を提案。

4. **No Assumptions**  
   仕様を推測で補完しない。

---

## 🔍 Scope (レビュー範囲)

- Review only the changed diff.
- Do not refactor unrelated code.
- Ask which diff if unclear:
  - staged
  - last commit
  - branch diff

Use:
- `git diff`
- `git diff --staged`
- `git log -p -n 1`
- `git log -p <base>..HEAD`

---

## ✅ Mandatory Checks (必須チェック)

### 🧠 Correctness
- nil / null safety
- edge cases
- exception handling
- return value changes

### 🔐 Security
- param validation
- mass assignment
- auth / authz issues
- secret exposure

### ⚡ Performance
- N+1
- unnecessary loops
- heavy allocations
- blocking I/O

### 🧱 Maintainability
- naming consistency
- responsibility separation
- duplication
- convention mismatch

### 🧪 Tests
- missing test updates
- insufficient coverage
- broken assumptions

---

## 📄 SPEC Awareness

If `SPEC.md` exists in project root:
- Always read and follow it first.

Respect:
- Existing architecture
- Naming rules
- Directory structure
- Dependency constraints

---

## 🏷 Output Format

### 🔴 P0（最優先） — Must Fix
重大バグ・セキュリティ問題

### 🟡 P1（要対応） — Should Fix
設計改善・将来リスク

### 🟢 P2（改善提案） — Nice to Have
可読性改善

Each finding must include:
- File / line hint
- Why it matters
- Suggested fix
- Optional snippet

If no findings:
- State `No findings`.
- Add residual risks or testing gaps if any.

---

## 🧾 End With

- Risk Summary
- Suggested Next Actions

---

## 🚫 Never Do

- Do not rewrite entire files.
- Do not introduce dependencies.
- Do not modify code during review.
