# アプリケーション名
원어민 Wanna ME In（ウォノミン）<br>
<br>

# アプリケーション概要
韓国語独学サポートアプリ。
원어민（ウォノミン）とは韓国語でネイティブスピーカーという意味です。<br>
教科書には載っていないネイティブスピーカーならではの言い回しを音声と文字で保存することで自分だけの韓国語の教科書を作ることができます。<br>
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
## 1. 学校で習う韓国語と実際にネイティブが使う言い回しが違う<br>
前職で韓国語ネイティブの方たちと仕事をするなかで、留学中に学校で習った表現をネイティブはあまり使っていないことに気付きました。<br>
また、韓国語の教材は旅行会話や初級者向けのものが多く、ビジネス会話に特化した教材が少なくなれるまでに苦戦した経験から、ネイティブの輪に入って働く人のための学習ツールを作りたいと考えました。<br>

## 2. ネイティブと話す機会が少ない
日本にいてネイティブと話す機会が少ないが、交流系のアプリに登録するのは勇気がいるという人も多いと感じます。
ネイティブと韓国語を話す機会が少ない人でも自分の好きな時間で自然な表現やイントネーションを身につける練習をサポートする語学学習ツールを開発することにしました。<br>
<br>

# 洗い出した要件
要件を定義したシート
https://docs.google.com/spreadsheets/d/1WUsmbtqMaBI2t9FCtWMc8jvV3SXFGeniRN97oKcKT4M/edit#gid=982722306
<br><br>


# 実装した機能についての画像やGIFおよびその説明

# 実装予定の機能
・感情別のタグ付け<br>
・音声を直接録音する機能<br>
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
## 1. ログイン状態に合わせてTOP画面のコンテンツを変えた 
アカウントのない方には登録を促す表示、ログイン後には投稿関連のページが表示されるように変えました。<br>
＜ログイン前＞[![Image from Gyazo](https://i.gyazo.com/1c973ff473d35941322ee23be6571933.gif)](https://gyazo.com/1c973ff473d35941322ee23be6571933)
<ログイン後>
[![Image from Gyazo](https://i.gyazo.com/27090dcf8bb8a3e084333c4ddf73343b.gif)](https://gyazo.com/27090dcf8bb8a3e084333c4ddf73343b)

## 2. ログインする時間帯によってヘッダーに表示される挨拶の内容が変わるようにした
実際にホテルで働いていた時にお客様にかけていた言葉を書きました。<br>
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


