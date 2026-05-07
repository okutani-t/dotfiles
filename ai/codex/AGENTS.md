# AGENTS.md (Global)

Global rules for all AI agents operating on this PC.
Applies to any repository, project, or task unless overridden by project-specific rules.

---

## 🛑 Core Principles (最優先原則)

1. **Be accurate over confident:** Prioritize correctness.
   （自信満々な推測より、正確さを優先せよ）
2. **Simple & Maintainable:** Favor simplicity over cleverness.
   （賢さよりシンプルさを。過剰な設計を避け、保守しやすい案を選べ）

---

## 🎨 Styling (スタイリング)

- **Prefer Tailwind CSS:** If Tailwind CSS is introduced in the project, use Tailwind utility classes for styling instead of writing custom CSS. Only write custom CSS for things Tailwind cannot express.
  （プロジェクトに Tailwind CSS が導入されている場合、スタイルは極力 Tailwind のユーティリティクラスで記述すること。Tailwind で表現できないものだけカスタム CSS を書くこと）

---

## 📖 Readable Code

- **Easy to Understand:** Code must be easy to read by others.
  （最優先は「他人がすぐ読めること」）
- **Clear Naming:** Use specific, intention-revealing names.
  （曖昧な命名を避け、意図が伝わる名前にする）
- **Simple Flow:** Keep conditions and control flow simple; avoid deep nesting.
  （分岐と制御フローを単純にし、深いネストを避ける）
- **Small, Focused Units:** Split unrelated logic into small functions.
  （無関係な処理は分離し、小さな関数にまとめる）
- **Keep Rails Views Simple:** In Rails views, avoid introducing variables unless truly necessary.
  （Rails の view では、明確に必要な場合を除き極力変数を使わないこと）
- **Stay Consistent:** Follow existing style and structure.
  （既存のスタイル・構造との一貫性を保つ）

---

## 💻 Working Rules & Environment (作業ルールと環境)

- **Respect Context:** Follow existing patterns and directory structures.
  （既存のルール、命名規則、ディレクトリ構造を尊重せよ）
- **Check Root SPEC.md:** If `SPEC.md` exists in the project root, read it before decisions.
  （プロジェクトルートに `SPEC.md` がある場合、判断前に必ず参照して従うこと）
- **Check Root `.codex/config.toml`:** If `.codex/config.toml` exists in the project root, read the relevant settings before decisions and follow them when executing work.
  （プロジェクトルートに `.codex/config.toml` がある場合、判断前に関連設定を確認し、作業実行時の前提として従うこと）
- **Default Skill Loading:** Load applicable `SKILL.md` first; if none apply, use the normal workflow.
  （毎ターン、適用可能な `SKILL.md` を先に読み込むこと。該当がなければ通常フローで進めること）
- **Minimal Impact:** Keep changes minimal; do not touch files outside task scope.
  （変更は最小限にし、タスク範囲外のファイルには触れないこと）
- **Environment Aware:** Check OS (macOS/Linux/Windows) before shell command suggestions.
  （コマンド提案前に実行環境OSを確認すること）
- **No Inventions:** Do not invent requirements, APIs, or libraries.
  （要件、API、ライブラリを捏造しないこと）
- **Whitespace Hygiene:** Do not add trailing whitespace.
  （行末に不要な空白を入れないこと）

---

## 🤖 Permission & Execution Policy (許可と実行ポリシー)

- **No-Ask by Default:** Execute routine, in-scope, non-destructive work without extra prompts.
  （通常の Codex 作業は、タスク範囲内かつ非破壊であれば追加確認なしで実行すること）
- **Ask Only for High-Risk Actions:** Explicit user request is required only for:
  （確認は高リスク操作に限定し、以下のみ明示依頼を必須とする）
  - File deletions
  - Overwriting configuration files
  - Installing new dependencies
  - Database schema changes
  - Reading or modifying `.env` files
  - Non-secret environment variable modifications
  （以下の操作は明示依頼がある場合のみ実行可能）
  - ファイル削除
  - 設定ファイル上書き
  - 依存追加
  - DBスキーマ変更
  - `.env` の読み取りまたは変更
  - 秘匿情報を除く環境変数の変更
- **Run Requested Work Directly:** Execute requested non-destructive tasks directly, including tests and `git add` / `git commit` / `git push`.
  （依頼された非破壊タスク（テストや `git add` / `git commit` / `git push` を含む）は直接実行すること）
- **Explicit Commit Shortcut:** Treat `$commit` as an explicit user request to create a git commit for the current worktree. Do not ask whether to commit; inspect the diff, choose a reasonable commit message if none is provided, and run the necessary `git add` / `git commit` steps directly.
  （`$commit` は、現在の作業ツリーを git commit する明示依頼として扱うこと。コミットするかどうかの確認はせず、差分を確認して必要なら妥当なコミットメッセージを補い、必要な `git add` / `git commit` を直接実行すること）
- **Escalate Only When Required:** If a required command is blocked by sandbox restrictions, rerun via platform escalation.
  （必要コマンドが sandbox 制約で失敗した場合のみ、プラットフォーム承認フローで昇格して再実行すること）
- **Reduce Repeat Prompts:** For recurring git escalations, include `prefix_rule` and request persistent approvals.
  （git の反復的な昇格では `prefix_rule` を付け、恒久許可を優先して承認プロンプトを減らすこと）
  - Recommended: `["git", "add"]`, `["git", "commit"]`, `["git", "push"]`
  （推奨: `["git", "add"]`, `["git", "commit"]`, `["git", "push"]`）
- **No Redundant Approval Chat:** If a command is covered by an approved persistent `prefix_rule`, execute directly without re-asking in chat.
  （承認済みの恒久 `prefix_rule` に含まれるコマンドは、チャットで再確認せず直接実行すること）
- **Docker Exec Prompt Reduction:** For recurring `docker compose exec` escalations, request persistent approval with `prefix_rule: ["docker", "compose", "exec"]`.
  （`docker compose exec` の反復的な昇格では `prefix_rule: ["docker", "compose", "exec"]` を付けて恒久許可を取り、承認プロンプトを減らすこと）
- **Platform-Limit Note:** Approval dialog behavior is controlled by the execution environment, not `AGENTS.md`.
  （承認ダイアログの挙動は実行環境側の制御であり、`AGENTS.md` だけでは無効化できない）

---

## 🔒 Safety & Boundaries (安全と境界)

- **Always Prohibited:** Never read or modify secrets or sensitive personal data.
  （常時禁止：秘匿情報および個人データの読み取り・変更は禁止）
- **Outside-Policy Destructive Actions:** Ask explicit permission before destructive operations outside this policy.
  （実行ポリシーに含まれない破壊的操作は、事前に明示許可を得ること）

---

## 💬 Language & Communication (言語と対話)

- **Default Language:** Respond in clear, simple **Japanese**.
  （回答は簡潔で分かりやすい日本語で行うこと）
- **Voice Input Awareness:** User instructions may be entered via Aqua Voice and can be phrased in natural spoken language; interpret intent generously before treating wording as strict specification.
  （ユーザー指示は Aqua Voice による音声入力で、自然な話し言葉になることがある。文面を厳密仕様として扱う前に、意図を汲んで解釈すること）
- **Source Code Comments:** Write source-code comments in **Japanese**.
  （ソースコード内コメントは日本語で記述すること）
- **Code & Logs:** Use **English** for code syntax, commit messages, and logs unless specified otherwise.
  （コード構文、コミットメッセージ、ログは指定がない限り英語を使用すること）

---

## ⚖️ Priority & Conflict Resolution (優先順位)

Order of precedence:

1. `SPEC.md` in the project root
2. Local `AGENTS.md` in the current directory
3. This Global `AGENTS.md`

If conflicts occur, follow the higher-priority rule.
（ルールが衝突した場合は上位の優先順位に従うこと）

`SKILL.md` is loaded first as workflow context, but conflicts are resolved by the precedence above.
（`SKILL.md` は実行フロー文脈として先に読み込むが、ルール衝突時は上記優先順位で解決する）

---

## ✨ Default Decision Rule (迷った時の判断基準)

When in doubt, choose the simpler, clearer, and safer option.
（迷った場合は、よりシンプル・明快・安全な選択を優先する）
