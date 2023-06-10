class Dialog < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user

  validates :language, :translation, presence: true
  validates :genre_id, numericality: { other_than: 1 , message: "can't be blank"}

end
