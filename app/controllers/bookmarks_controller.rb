class BookmarksController < ApplicationController
  expose(:bookmarks)
  expose(:bookmark, attributes: :bookmark_params)
  expose(:website)
  
  def create
    bookmark.website = Website.where(domain: bookmark.extracted_domain).first_or_create
    bookmark.title = MetaInspector.new(bookmark.url).title
    bookmark.short_url = MetaInspector.new("http://tinyurl.com/api-create.php?url=#{bookmark.url}")
    if bookmark.save
      redirect_to bookmark, notice: 'Bookmark was successfully created.'
    else
      render :new
    end
  end

  def update
    if bookmark.save
      redirect_to bookmark, notice: 'Bookmark was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if bookmark.destroy
      redirect_to bookmarks_url, notice: 'Bookmark was successfully destroyed.'
    else
      redirect_to bookmarks_url, notice: "You can't delete this bookmark."
    end
  end

  private
  
  def bookmark_params
    params.require(:bookmark).permit(:url, :all_tags)
  end
end
