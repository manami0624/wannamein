class DialogTagRelation < ApplicationRecord
  belongs_to :dialog
  belongs_to :tag
end
