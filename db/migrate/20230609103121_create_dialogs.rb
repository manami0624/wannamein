class CreateDialogs < ActiveRecord::Migration[6.0]
  def change
    create_table :dialogs do |t|
      t.references   :user,        null: false, foreign_key: true
      t.string       :language,      null: false
      t.string       :translation, null: false
      t.text         :memo
      t.integer      :category_id, nill: false
      t.string       :file
      t.timestamps
    end
  end
end
