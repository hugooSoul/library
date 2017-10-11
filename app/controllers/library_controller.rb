class LibraryController < ApplicationController

  def index
    @books = Book.where(available: true).order("created_at DESC").page(params[:page]).per(5)
  end

end
