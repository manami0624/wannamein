class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'カフェ' },
    { id: 3, name: 'ホテル' },
    { id: 4, name: '秘書' },
    { id: 5, name: 'IT' },
    { id: 6, name: 'ショップ' },
    { id: 7, name: '事務' },
    { id: 8, name: '学校' },
    { id: 9, name: '航空・旅行' },
    { id: 10, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :dialogs
  end