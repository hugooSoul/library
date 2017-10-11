class BooksController < ApplicationController

  before_action :authenticate_user!, except: [:show]
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :is_admin?, except: [:show, :update]

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    @book.published_date = @book.published_date.beginning_of_day
    respond_to do |format|
     if @book.save
       format.html { redirect_to admin_index_path, flash: { success: "New book saved" } }
       format.json { render :new, status: :ok, location: @book }
     else
       format.html { redirect_to :new_book, flash: { notice: "Something went wrong" }}
       format.json { render json: @book.errors, status: :unprocessable_entity }
     end
    end
  end

  def edit
  end

  def update
    @book.slug = nil

    if params[:taken_by]
      @book.taken = params[:taken_by]
      @book.available = false
    end

    if @book.available = true
        @book.taken = ""
    end

    respond_to do |format|
      if @book.update(book_params)
        if params[:taken_by]
          format.html { redirect_to root_path, flash: { notice: "You got the book!!!" } }
          format.json { render :edit, status: :ok, location: @book }
        else
          format.html { redirect_to admin_index_path, flash: { notice: "Book was updated" } }
          format.json { render :edit, status: :ok, location: @book }
        end
      else
        format.html { redirect_to edit_book_path(@book), flash: { notice: "Something went wrong" }}
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to admin_index_path }
      flash[:alert] = "The book was deleted"
      format.json { head :no_content }
    end
  end


  private

  def set_book
    @book = Book.friendly.find(params[:id])
  end

  def book_params
    if params[:taken_by]
      params.permit(:name, :author, :category, :published_date, :available, :taken)
    else
      params.require(:book).permit(:name, :author, :category, :published_date, :available, :taken)
    end
  end

  def is_admin?
    if current_user.admin? != true
      respond_to do |format|
        format.html { redirect_to root_path, flash: { notice: "No no no, you aren't authorized for this option!"} }
      end
    end
  end

end
