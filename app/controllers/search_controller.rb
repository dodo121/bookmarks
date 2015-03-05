class SearchController < ApplicationController
  expose_decorated(:found_bookmarks, decorator: BookmarkDecorator) { Bookmark.search(params[:search_term]) }
  expose_decorated(:found_websites, decorator: WebsiteDecorator) { Website.search(params[:search_term]) }
  expose_decorated(:found_tags, decorator: TagDecorator) { Tag.search(params[:search_term]) }

  def index
  end

end
