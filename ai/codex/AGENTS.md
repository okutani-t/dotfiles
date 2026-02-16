# AGENTS.md (Global)

Global rules for all AI agents operating on this PC.
Applies to any repository, project, or task unless overridden by project-specific rules.
AI-first, short, and strict.

---

## 🛑 Core Principles (最優先原則)

1. **Be accurate over confident:** Prioritize correctness.
   （自信満々な推測より、正確さを優先せよ）

2. **Simple & Maintainable:** Favor simplicity over cleverness. No over-engineering.
   （賢さよりシンプルさを。過剰な設計を避け、保守しやすい案を選べ）

---

## 💻 Working Rules & Environment (作業ルールと環境)

- **Respect Context:** Follow existing patterns, conventions, and directory structures.
  （既存のルール、命名規則、ディレクトリ構造を尊重せよ）

- **Check Root SPEC.md:**
  If a `SPEC.md` exists in the **project root**, always read and follow it before making decisions.
  （プロジェクトのルートディレクトリに `SPEC.md` が存在する場合は、必ず参照し、それに従うこと）

- **Minimal Impact:** Keep changes minimal. Do not touch files outside the task scope.
  （変更は最小限に。タスク範囲外のファイルに無断で触れないこと）

- **Environment Aware:** Check OS (macOS/Linux/Windows) before suggesting shell commands.
  （コマンドを提案する前に、必ず実行環境のOSを確認せよ）

- **No Inventions:** Do NOT invent requirements, APIs, or libraries.
  （要件、仕様、ライブラリを捏造しないこと）

- **Default Skill Loading:**
  On every turn, load and follow applicable `SKILL.md` instructions first before other workflows.
  If no applicable skill exists, continue with the normal workflow.
  （毎ターン、適用可能な `SKILL.md` の指示を他のワークフローより先に読み込み、従うこと。適用可能なスキルがなければ通常フローで継続すること）

- **Whitespace Hygiene:** Do not add trailing whitespace at the end of lines.
  （行末に不要な空白を入れないこと）

---

## 🤖 Execution Policy (実行ポリシー)

- Non-destructive edits within the explicitly requested task scope may be performed without additional approval.
  （ユーザーが明示的に依頼したタスク範囲内の非破壊的変更は、追加承認なしで実行してよい）

- If a task is explicitly requested by the user, assume permission is granted within that scope.
  （ユーザーが明示的に依頼した場合、そのタスク範囲内では承認済みとみなす）

- When requested work includes running tests, execute commands such as `bundle exec rspec` or `yarn test` without additional confirmation if they stay within task scope and are non-destructive.
  （依頼された作業にテスト実行が含まれる場合、タスク範囲内かつ非破壊であれば、`bundle exec rspec` や `yarn test` などを追加確認なしで実行すること）

- When requested work includes version control operations, execute commands such as `git commit` or `git push` without additional confirmation if they stay within task scope.
  （依頼された作業にバージョン管理操作が含まれる場合、タスク範囲内であれば、`git commit` や `git push` などを追加確認なしで実行すること）

- Approval is required only for:
  - File deletions
  - Overwriting configuration files
  - Installing new dependencies
  - Database schema changes
  - Secret or environment variable modifications

  （以下の場合のみ承認を求めること：
   - ファイル削除
   - 設定ファイル上書き
   - 依存追加
   - DBスキーマ変更
   - 秘匿情報や環境変数の変更）

---

## 💬 Language & Communication (言語と対話)

- **Default Language:** Respond in clear and simple **Japanese**.
  （回答は日本語で行うこと）

- **Source Code Comments:**
  All comments written inside source code must be in **Japanese**.
  （ソースコード内に記載するコメントは日本語で記述すること）

- **Code & Logs:** Use **English** for code syntax, commits, and logs unless specified otherwise.
  （コード構文、コミットメッセージ、ログ等は、指定がない限り英語を使用せよ）

---

## 🔒 Safety & Boundaries (安全と境界)

- **Data Privacy:** Never read or modify secrets, `.env`, or sensitive personal data.
  （秘匿情報、環境変数、個人データに触れないこと）

- **Destructive Actions:** Ask for explicit permission before performing destructive operations outside the defined execution policy.
  （実行ポリシーで定義された範囲外の破壊的操作は必ず事前に許可を得ること）

- **Dependency Safety:** Confirm before installing new software or packages unless explicitly requested.
  （明示的に依頼されていない限り、新しいソフトやパッケージのインストールは事前確認を必須とする）

---

## ⚖️ Priority & Conflict Resolution (優先順位)

The order of precedence is:

1. **`SPEC.md` in the project root**
2. **Local `AGENTS.md` in the current directory**
3. **This Global `AGENTS.md`**

If conflicts occur, follow the higher-priority rule.
（ルールが衝突した場合は、上位の優先順位に従うこと）

---

## ✨ Default Decision Rule (迷った時の判断基準)

When in doubt, choose the option that is:
**Simpler, Clearer, and Safer.**
（よりシンプル、より明快、より安全な方を選べ）
