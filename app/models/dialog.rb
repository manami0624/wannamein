class Dialog < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user

  validates :language, :translation, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}

  def self.search(search)
    if search != ""
      Dialog.where(['language LIKE ? OR translation LIKE ?', "%#{search}%", "%#{search}%"])
    else
      Dialog.all
    end
  end

  
  mount_uploader :file, AudiofileUploader
end
