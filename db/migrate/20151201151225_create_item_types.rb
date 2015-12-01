class CreateItemTypes < ActiveRecord::Migration
  def change
    create_table :item_types do |t|
      t.string :name
      t.string :kind
      t.text   :describe
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
