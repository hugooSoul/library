class CategoriesController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :category_params, except: [:home, :index, :new, :create, :edit, :show, :destroy]
  before_action :is_admin?, except: [:index, :show]

  def home
    @categories = Category.all
  end

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to admin_category_path, flash: { success: "New category saved" } }
        format.json { render :new, status: :ok, location: @category }
      else
        format.html { redirect_to :new_category, flash: { notice: "Something went wrong, try later!" }}
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    @category.slug = nil

    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to admin_category_path, flash: { notice: "Category was updated" } }
        format.json { render :edit, status: :ok, location: @category }
      else
        format.html { redirect_to edit_category_path(@category), flash: { notice: "Something went wrong" }}
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to admin_index_path }
      flash[:alert] = "The category was deleted"
      format.json { head :no_content }
    end
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
