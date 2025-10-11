---
argument-hint: [notion-ticket]
description: ブラウザで振る舞いを確認する
---

# Check Behavior

## コンテキスト
以下の内容を確認してください。
- 指定された Notion チケットの内容
- チケットに含まれる "Figma" プロパティのリンク先のデザイン
- チケット本文に含まれる Figma リンク先のデザイン

### ルール
- 対象が省略された場合は要求する
- 実装と対応する Figma デザインが見つからない場合は要求する
- 情報の取得には GitHub, Notion, Figma の MCP を使用する

## タスク
実装内容が正しく動作することをブラウザで確認してください。

## ルール
- ブラウザ操作およびスクリーンショットには Playwright MCP を使用する
- 実装内容のスクリーンショットを保存する
- アカウントは以下を使用する
  - Email: `owner@jobaria.cloud`
  - Password: `hjy1tua_DTZ6gez!pfu`
- 完了後に確認できたこととできなかったことをリストアップする
