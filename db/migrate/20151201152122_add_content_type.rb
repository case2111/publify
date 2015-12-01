class AddContentType < ActiveRecord::Migration
  def change
    add_belongs_to :contents, :item_type
  end
end
