class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '-使いたい場面を選択-' },
    { id: 2, name: '社内' },
    { id: 3, name: '接客' },
    { id: 4, name: '問い合わせ回答例' },
  ]

  include ActiveHash::Associations
  has_many :dialogs
  end