class BookmarkDecorator < Draper::Decorator
  delegate_all

  def show_info
    bookmark.title
  end
end
