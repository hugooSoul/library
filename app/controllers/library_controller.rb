class LibraryController < ApplicationController

  def index
    @books = Book.order("created_at DESC").page(params[:page]).per(5)
    @messages = Message.last
  end

end
