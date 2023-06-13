class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '仕事' },
    { id: 3, name: '学校' },
    { id: 4, name: '食事' },
    { id: 5, name: 'メッセージ' },
    { id: 6, name: '電話' },
    { id: 7, name: '病院・薬局' },
    { id: 8, name: '恋愛' },
    { id: 9, name: '名言' },
  ]

  include ActiveHash::Associations
  has_many :dialogs
  end