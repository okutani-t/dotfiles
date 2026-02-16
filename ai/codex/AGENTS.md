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
- **Check Root SPEC.md:** If a `SPEC.md` exists in the project root, read and follow it before making decisions.
  （プロジェクトルートに `SPEC.md` がある場合、判断前に必ず参照して従うこと）
- **Default Skill Loading:** On every turn, load applicable `SKILL.md` first. If none apply, use the normal workflow.
  （毎ターン、適用可能な `SKILL.md` を先に読み込むこと。該当がなければ通常フローで進めること）
- **Minimal Impact:** Keep changes minimal. Do not touch files outside task scope.
  （変更は最小限にし、タスク範囲外のファイルには触れないこと）
- **Environment Aware:** Check OS (macOS/Linux/Windows) before suggesting shell commands.
  （コマンド提案前に実行環境OSを確認すること）
- **No Inventions:** Do not invent requirements, APIs, or libraries.
  （要件、API、ライブラリを捏造しないこと）
- **Whitespace Hygiene:** Do not add trailing whitespace.
  （行末に不要な空白を入れないこと）

---

## 🤖 Execution Policy (実行ポリシー)

- If work is explicitly requested by the user and remains in task scope, proceed without extra chat confirmation.
  （ユーザーが明示依頼した作業でタスク範囲内なら、チャット上の追加確認なしで進めてよい）
- Run requested tests (for example `bundle exec rspec`, `yarn test`) directly when non-destructive.
  （依頼されたテスト実行は非破壊であれば直接実行すること）
- Run requested version-control operations (for example `git add`, `git commit`, `git push`) directly.
  （依頼された `git add` / `git commit` / `git push` は直接実行すること）
- If a required command fails due to sandbox restrictions, rerun with privilege escalation via the platform prompt.
  （必要コマンドが sandbox 制約で失敗した場合、プラットフォーム承認フローで権限昇格して再実行すること）

### Platform Escalation Setup (権限プロンプト削減設定)

- To avoid repeated approval prompts for git operations, approve persistent prefix rules in the platform prompt.
  （git 操作の承認プロンプトを減らすため、プラットフォームの承認画面で恒久許可の prefix rule を承認すること）
- Platform approval dialogs are controlled by the execution environment and cannot be disabled by `AGENTS.md` alone.
  （プラットフォームの承認ダイアログは実行環境側の制御であり、`AGENTS.md` だけでは無効化できない）
- When escalation is required for git operations, always include an appropriate `prefix_rule` in the escalation request.
  （git 操作で権限昇格が必要な場合、昇格リクエストに適切な `prefix_rule` を必ず付けること）
- Recommended prefix rules:
  - `["git", "add"]`
  - `["git", "commit"]`
  - `["git", "push"]` (if push is used regularly)
  （推奨 prefix rule：
  - `["git", "add"]`
  - `["git", "commit"]`
  - `["git", "push"]`（push を常用する場合））

### Actions Requiring Explicit User Request (明示依頼が必要な操作)

- File deletions
- Overwriting configuration files
- Installing new dependencies
- Database schema changes
- Reading or modifying `.env` files
- Non-secret environment variable modifications

（以下の操作は、ユーザーの明示依頼がある場合のみ実行可能）
- ファイル削除
- 設定ファイル上書き
- 依存追加
- DBスキーマ変更
- `.env` の読み取りまたは変更
- 秘匿情報を除く環境変数の変更

---

## 🔒 Safety & Boundaries (安全と境界)

- **Always Prohibited:** Never read or modify secrets or sensitive personal data.
  （常時禁止：秘匿情報および個人データの読み取り・変更は禁止）
- **`.env` Exception:** Read or modify `.env` only when explicitly requested by the user.
  （`.env` 例外：ユーザーの明示依頼がある場合のみ読み取り・変更を許可）
- **Destructive Actions:** Ask for explicit permission before destructive operations outside this execution policy.
  （本実行ポリシー外の破壊的操作は、事前に明示許可を得ること）
- **Dependency Safety:** Follow the execution policy for installing software or packages.
  （ソフトウェアやパッケージ追加は実行ポリシーに従うこと）

---

## 💬 Language & Communication (言語と対話)

- **Default Language:** Respond in clear, simple **Japanese**.
  （回答は簡潔で分かりやすい日本語で行うこと）
- **Source Code Comments:** Write source-code comments in **Japanese**.
  （ソースコード内コメントは日本語で記述すること）
- **Code & Logs:** Use **English** for code syntax, commit messages, and logs unless otherwise specified.
  （コード構文、コミットメッセージ、ログは指定がない限り英語を使用すること）

---

## ⚖️ Priority & Conflict Resolution (優先順位)

Order of precedence:

1. `SPEC.md` in the project root
2. Local `AGENTS.md` in the current directory
3. This Global `AGENTS.md`

If conflicts occur, follow the higher-priority rule.
（ルールが衝突した場合は上位の優先順位に従うこと）

`SKILL.md` is loaded first as workflow context, but rule conflicts are resolved by the precedence above.
（`SKILL.md` は実行フロー文脈として先に読み込むが、ルール衝突時は上記優先順位で解決する）

---

## ✨ Default Decision Rule (迷った時の判断基準)

When in doubt, choose the option that is:
**Simpler, Clearer, and Safer.**
（迷った場合は、よりシンプル・明快・安全な選択を優先する）
