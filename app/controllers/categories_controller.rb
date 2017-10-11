class CategoriesController < ApplicationController

  before_action :authenticate_user!, except: [:show]
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :category_params, except: [:new, :create]
  before_action :is_admin?

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to admin_index_path, flash: { success: "New category saved" } }
        format.json { render :new, status: :ok, location: @category }
      else
        format.html { redirect_to :new_category, flash: { notice: "Something went wrong, try later!" }}
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def method_name

  end


  private

  def set_category
    @category = Category.friendly.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :description)
  end

  def is_admin?
    if current_user.admin? != true
      respond_to do |format|
        format.html { redirect_to root_path, flash: { notice: "No no no, you aren't authorized for this option!"} }
      end
    end
  end

end
