class ItemType < ActiveRecord::Base
    belongs_to :user
    has_many  :articles
    scope :get_nav, -> {where('kind = ?', 'nav')}
    def self.find_items
        ItemType.get_nav
    end
end
