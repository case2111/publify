class ItemTypeSelfConnect < ActiveRecord::Migration
  def change
    add_column :item_types, :menu_id, :integer
  end
end
