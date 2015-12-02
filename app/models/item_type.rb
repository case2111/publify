class ItemType < ActiveRecord::Base
    belongs_to :user
    has_many   :articles
    has_many   :submenu, class_name: 'ItemType', foreign_key: 'menu_id'
    belongs_to :menu, class_name: 'ItemType'
    scope :get_nav, -> {where('kind = ?', 'nav')}
    def self.find_items
        ItemType.get_nav
    end
end
