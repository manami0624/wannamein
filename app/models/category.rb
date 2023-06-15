class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '-カテゴリを選択-' },
    { id: 2, name: '仕事' },
    { id: 3, name: '日常' },
    { id: 4, name: '旅行' },
    { id: 5, name: '名言' },
  ]

  include ActiveHash::Associations
  has_many :dialogs
  end