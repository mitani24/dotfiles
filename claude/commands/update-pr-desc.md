---
argument-hint: [pr-number]
description: PR Description を更新
---

# Update PR Description

## タスク
GitHub PR の内容を確認し、Description を更新してください。
対象が省略された場合は `!gh pr view --json url` で取得する。

## ルール
- GitHub MCP Server を使用する
- 日本語で記述する
- **`pull_request_template.md` の構成を遵守する**
- **必要最低限の情報のみを用いて最大限簡潔に記述する**
- **コメントアウト（`<!-- -->`）された部分は削除せずそのまま維持する**
- ゴールは箇条書きで記述する
- Notion Ticket のセクションは変更しない
- 必要に応じて mermaid で図解を記載する
- 読者に注意を促したい内容はアラート記法を使用する
- 補足情報を示す場合は脚注を使用する

### アラート記法

```md
> [!NOTE]
> Useful information that users should know, even when skimming content.

> [!TIP]
> Helpful advice for doing things better or more easily.

> [!IMPORTANT]
> Key information users need to know to achieve their goal.

> [!WARNING]
> Urgent info that needs immediate user attention to avoid problems.

> [!CAUTION]
> Advises about risks or negative outcomes of certain actions.
```

### 脚注

```md
Here is a simple footnote[^1].

A footnote can also have multiple lines[^2].

[^1]: My reference.
[^2]: To add line breaks within a footnote, prefix new lines with 2 spaces.
  This is a second line.
```
