class AdminController < ApplicationController

  before_action :authenticate_user!
  before_action :is_admin?

  def index
    @categories = Category.all
    @books = Book.all.order("created_at DESC")
  end

  private

  def is_admin?
    if current_user.admin? != true
      respond_to do |format|
        format.html { redirect_to root_path, flash: { notice: "What are you doing?"} }
      end
    end
  end

end
