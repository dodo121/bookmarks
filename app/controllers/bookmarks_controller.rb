class BookmarksController < ApplicationController
  expose(:bookmarks)
  expose(:bookmark)
  
  def create
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
    bookmark.destroy
    redirect_to bookmarks_url, notice: 'Bookmark was successfully destroyed.'
  end

  private
  
  def bookmark_params
    params.require(:bookmark).permit()
  end
end
