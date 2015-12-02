class ItemTypesController < ApplicationController
    layout :theme_layout, except: [:trackback]
    def all_items
        @items = ItemType.all
    end
    def show
        @item = ItemType.find(params[:id])
        # @articles = item.articles.all
        conditions = (Blog.default.statuses_in_timeline) ? ['type in (?, ?)', 'Article', 'Note'] : ['type = ?', 'Article']

        limit = this_blog.per_page(params[:format])
        if params[:year].blank?
            @articles = Content.item_process(params[:id]).published.where(conditions).page(params[:page]).per(limit)
        else
            @articles = Content.item_process(params[:id]).published_at(params.values_at(:year, :month, :day)).where(conditions).page(params[:page]).per(limit)
        end

        @page_title = this_blog.home_title_template
        @description = this_blog.home_desc_template
        if params[:year]
            @page_title = this_blog.archives_title_template
            @description = this_blog.archives_desc_template
        elsif params[:page]
            @page_title = this_blog.paginated_title_template
            @description = this_blog.paginated_desc_template
        end
        @page_title = @page_title.to_title(@articles, this_blog, params)
        @description = @description.to_title(@articles, this_blog, params)

        @keywords = this_blog.meta_keywords
    end
    private
    def theme_layout
        this_blog.current_theme.layout(action_name)
    end
end