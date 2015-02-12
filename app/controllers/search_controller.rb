class SearchController < ApplicationController
  expose(:found_bookmarks) { Bookmark.search(params[:search_term]) }
  
  def index
  end
end
