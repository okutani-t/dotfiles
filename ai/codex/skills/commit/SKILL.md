---
name: commit
description: Explicit trigger commit skill. Trigger when user requests $commit.
---

Create a git commit for the current repository without extra confirmation chat.

Treat `$commit` as an explicit request to create a git commit without extra confirmation chat.

Workflow:

1. Read `SPEC.md` if it exists in the repository root.
2. Inspect the current worktree with `git status --short` and `git diff` as needed.
3. Decide commit scope:
   - If there are staged changes, prefer committing staged changes as-is.
   - If nothing is staged and the worktree changes look like one coherent task, stage the relevant files and continue.
   - If there are clearly multiple unrelated change groups, stop and ask the user what should be committed.
4. Choose the commit message:
   - Use the user-provided message if one exists.
   - Otherwise infer a concise English message from the diff.
5. Run `git add` / `git commit` directly.
6. If the required git command is already covered by an approved persistent `prefix_rule`, execute it directly without additional approval handling.
7. If sandbox blocks git, retry immediately via platform escalation and include persistent `prefix_rule` values such as `["git", "add"]` and `["git", "commit"]` so later `$commit` runs can execute without another approval dialog when the platform persists those approvals.

Guardrails:

- Do not ask whether to commit when the request is `$commit`.
- Do not add extra confirmation chat before the first `git add` / `git commit` attempt.
- Do not include unrelated files just to make the commit succeed.
- If there is nothing to commit, say so briefly.
- If the repository state is ambiguous, ask only about scope.
- Approval dialog behavior is controlled by the execution environment, not by this file alone.

Final response:

- Report the commit hash and message.
- Or explain briefly why no commit was made.
