閲覧ありがとうございます。
こちらはポートフォリオ用サイトです。
 実装した機能
グインログアウト機能
投稿一覧表示機能
投稿詳細表示機能
投稿機能
投稿検索機能
いいね機能
返信機能
フォローフォロワー機能 "gem acts_as_follower"
画像ファイルアップロード機能
ページネーション機能"will_paginate,3.1.6"
セキュリティ、validation gem bcrypt
タグ付け、タグ検索機能'acts-as-taggable-on'
使用した言語等

AWSのcloud9でruby/RubyonRailsを使用しました。
バージョン管理はGitを使用し、改修単位ごとにbranchを作ってGithubにpushをしています。
また、デプロイはherokuを使用しています。
"https://github.com/kkfender/tweet_app

制作期間
約一ヵ月ほどです。

参考サイト、書籍
<サイト>

  Progate
  railsチュートリアル
  Qiita
  teratail
  fontawesome
<書籍>
  現場で使えるRuby on Rails5速習実践ガイド>

終わりに
  
  テスト
  
  単体テストと統合テストに関して知識不足もあり、ほとんど行えていなえていません。今後はしっかりと学習時間を取って、RSpec,Capybara,FactoryBot等でテストの
	作成をメインに学習していきたいと考えています。
	
		
  >Rubyらしい記述
  
  erbから脱却しhamlやslimでの記述、form_tag、form_forではなくform_withでの記述など、Rubyらしく書き換えたいです。
	また、カスタムヘルパーをあまり使用していないのでHTML内で冗長な記述になっています。
	今後リファクタリングをする際に可読性、保守性に優れたコードを書きたいと思います。
	
  実装したい機能
  
  
  mecabとgem 'natto'を使い、形態素解析を行い、POSTされた投稿に自動でタグを設定したいです。
  外部APIと連携し、地図表記等を行えるようにしたいです。
  その他メッセージ機能、ソート機能、管理ユーザーに関する機能等を追加したいです。
	また、非同期処理で画面遷移させずにアクションを起こしたいです。	
  
