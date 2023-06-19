class Tag < ApplicationRecord
  has_many :dialog_tag_relations, dependent: :destroy
  has_many :dialogs, through: :dialog_tag_relations, dependent: :destroy
end
