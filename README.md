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


