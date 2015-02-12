class SearchController < ApplicationController
  expose(:found_bookmarks) { Bookmark.search(params[:search_term]) }
  expose(:found_websites) { Website.search(params[:search_term]) }
  expose(:found_tags) { Tag.search(params[:search_term]) }
  
  def index
  end
end
