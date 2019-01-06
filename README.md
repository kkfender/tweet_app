# README

閲覧ありがとうございます。
こちらはポートフォリオ用のツイッターの疑似サイトです。
実装した機能

ログインログアウト機能
投稿一覧表示機能
投稿詳細表示機能
投稿機能
投稿検索機能
いいね機能
フォローフォロワー機能 "gem acts_as_follower"
画像ファイルアップロード機能(プロフィールのみ)
ページネーション機能"will_paginate,3.1.6"
セキュリティ、validation gem bcrypt

使用した言語等

AWSのcloud9でruby/RubyonRailsを使用しました。
バージョン管理はGitを使用し、改修単位ごとにbranchを作ってGithubにpushをしています。
また、デプロイはherokuを使用しています。


制作期間
約20日ほどです。

参考サイト、書籍
<サイト>
"Progate"  "https://prog-8.com/"
"railsチュートリアル"  "https://railstutorial.jp/"
"Qiita"  "https://qiita.com/"
"teratail"  "https://teratail.com/"

<書籍>


"現場で使えるRuby on Rails5速習実践ガイド""https://www.amazon.co.jp/現場で使える-Ruby-Rails-5速習実践ガイド-大場寧子/dp/4839962227"

結び
 テスト
  
  
    単体テストと統合テストに関して知識不足もあり、ほとんど行えていなえていません。
    今後はしっかりと学習時間を取って、RSpec,Capybara,FactoryBot等でテストの
	　　作成をメインに学習していきたいと考えています。
	
　　Rubyらしい記述
  
  
 　　　 erbから脱却しhamlやslimでの記述、form_tagではなくform_for、form_withでの記述な
 　　　 ど、Rubyらしく書き換えたいです。
　　	また、カスタムヘルパーをあまり使用していないのでHTML内で冗長な記述になっています。
　　	今後リファクタリングをする際に可読性、保守性に優れたコードを書きたいと思います。
	　　
　　実装したい機能
  
  
 　　　 画像投稿機能、返信機能、メッセージ機能、確認画面、ソート機
 　　　 能、管理ユーザーに関する機能等を追加したいです。
	　　　また、非同期処理で画面遷移させずにアクションを起こしたいです。	
  