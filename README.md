# アプリケーション名
원어민 Wanna ME In（ウォノミン）<br>
<br>

# アプリケーション概要
韓国語勉強アプリ。
원어민は韓国語でネイティブスピーカーという意味。<br>
教科書には載っていないネイティブスピーカーならではの言い回しを音声と文字で保存することで自分だけの韓国語の教科書を作ることができる。<br>
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
2. カテゴリー別に検索<br>
<br>

# アプリケーションを作成した背景
前職で韓国語ネイティブの方たちと仕事をするなかで、留学中に学校で習った表現をネイティブはあまり使っていないことに気付いた。また、韓国語の教材は旅行会話や初級者向けのものが多く、会話に特化した上級者向けの教材が少ないと感じたことから、ネイティブと韓国語を話す機会が少ない人でも自分の好きな時間で自然な表現やイントネーションを身につける練習をサポートする語学学習ツールを開発することにした。<br>
<br>

# 洗い出した要件
要件を定義したシート
https://docs.google.com/spreadsheets/d/1WUsmbtqMaBI2t9FCtWMc8jvV3SXFGeniRN97oKcKT4M/edit#gid=982722306
<br><br>


# 実装した機能についての画像やGIFおよびその説明

# 実装予定の機能

# データベース設計

# 画面遷移図

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


