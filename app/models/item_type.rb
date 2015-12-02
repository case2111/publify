class ItemType < ActiveRecord::Base
    belongs_to :user
    has_many  :articles
    def self.find_items
        ItemType.all
    end
end
