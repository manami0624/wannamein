# アプリケーション名
원어민 Wanna Me In（ウォノミン）<br>
<br>

# アプリケーション概要
韓国人と日本人が共に働く環境で仕事をする人たちの社員教育をサポートするアプリです。<br>
원어민（ウォノミン）とは韓国語でネイティブスピーカーという意味です。<br>
交代勤務などでロールプレイングをする時間がなくても社内の用語や接客に必要なトークを共有し合うことができます。<br>
<br>

# URL
https://wannamein.onrender.com/ <br>
<br>

# テスト用アカウント
・Basic認証パスワード: admin<br>
・Basic認証ID: 2222<br>
・メールアドレス：test@test.jp<br>
・パスワード：123test<br>
<br>

# 利用方法
## 投稿する<br>
1. トップページ（一覧ページ）からユーザー新規登録を行う
2. 投稿ボタンから、覚えて使いたいセリフを文字と音声(mp3ファイル)で投稿する
<br>

## 検索する<br>
1. トップページからキーワード検索
2. 場面別に検索<br>
<br>

# アプリケーションを作成した背景
## ネイティブの輪に入って働く人のための学習ツールを作りたい
<br>

## 解決したい問題
1. 学校で習う韓国語と実際にネイティブが使う言い回しが違う<br>
前職で韓国語ネイティブの方たちと仕事をするなかで、留学中に学校で習った表現をネイティブはあまり使っていないことに気付きました。<br>
また、韓国語の教材は旅行会話や初級者向けのものが多く、ビジネス会話に特化した教材が少なく慣れるまでに苦戦しました。<br>

2. ロールプレイングの時間がない<br>
前職では24時間の交代勤務のため基本的に一人でフロントにいる時間が長く、先輩とロールプレイングする時間がないままお客様の対応をしないといけない状況でした。<br>

 3. お互いに何が分からないのか分からない<br>
ネイティブは当たり前に使っている言い回しなので、外国人が何に難しさを感じているのか理解することが難しいです。韓国人の先輩に、日本語での電話対応で電話番号（数字）を正しく聞き取るのが難しいから代わりに電話をしてほしい、と頼まれた時に自分に当たり前のことが海外の人には難しいと感じることがあるんだと気付きました。<br>
<br>

以上のことを解決するために、音声と文字で知りたいトーク、覚えてほしいトークをお互いに共有し合えるアプリを作りたいと考えました。
<br>


# 洗い出した要件
[要件を定義したシート](https://docs.google.com/spreadsheets/d/1WUsmbtqMaBI2t9FCtWMc8jvV3SXFGeniRN97oKcKT4M/edit#gid=982722306)


# 実装した機能についての画像やGIFおよびその説明

# 実装予定の機能
・感情別のタグ付け<br>
・音声を直接録音する機能<br>
・録音した音声と自分の声を同時に再生しながら比較できる機能<br>
<br>

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/d8eb3ec5f38169d2a53375322c437b16.jpg)](https://gyazo.com/d8eb3ec5f38169d2a53375322c437b16)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/002d5362737786bc04bdd50af3485c3e.png)](https://gyazo.com/002d5362737786bc04bdd50af3485c3e)

# 開発環境
・フロントエンド<br>
・バックエンド<br>
・インフラ<br>
・テスト<br>
・テキストエディタ<br>
・タスク管理<br>
<br>

# ローカルでの動作方法
以下のコマンドを順に実行<br>
% git clone https://github.com/manami0624/wannamein <br>
% cd wannnamein <br>
% bundle install <br>
% yarn install <br>
<br>

# 工夫したポイント
## 1. ログイン状態に合わせて変わるTOP画面のコンテンツ 
アカウントのない方には登録を促す表示、ログイン後には投稿関連のページが表示されるように変えました。<br>

## 2. 人間味・温かみを感じられる挨拶文
ログインする時間帯によってヘッダーに表示される挨拶の内容が変わるようにしました。
実際にホテルで働いていた時にお客様にかけていた言葉を書きました。<br>
[![Image from Gyazo](https://i.gyazo.com/f5ab3b72a57d7c099904f6183134eba3.jpg)](https://gyazo.com/f5ab3b72a57d7c099904f6183134eba3)

[![Image from Gyazo](https://i.gyazo.com/c7c85657c491661b4d85a5fd89e4fd73.jpg)](https://gyazo.com/c7c85657c491661b4d85a5fd89e4fd73)

[![Image from Gyazo](https://i.gyazo.com/961004ab73d64be0c43431f56989eb74.jpg)](https://gyazo.com/961004ab73d64be0c43431f56989eb74)

## 3. レスポンシブデザイン
語学系のアプリはスマートフォンやタブレットでみることが多いので、大きさやコンテンツの密度を意識しました。<br>
<br>

# テーブル設計

## users テーブル

| Column             | Type    | Options                  |
| ------------------ | ------- | ------------------------ |
| name               | string  | null: false              |
| email              | string  | null: false,unique: true |
| encrypted_password | string  | null: false              |

### Association
- has_many :dialogs
- has_many :comments



## dialogs テーブル

| Column           | Type       | Options                        |
| -----------------| ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| language         | string     | null: false                    |
| translation      | string     | null: false                    |
| category_id      | integer    | null: false                    |
| file             | string     |                                |

### Association
- belongs_to :user
- has_many   :comments


## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| content   | text       | null: false                    |
| dialog    | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association
- belongs_to :dialog
- belongs_to :user


