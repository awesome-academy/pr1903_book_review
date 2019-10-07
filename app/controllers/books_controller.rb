class BooksController < ApplicationController
  before_action :find_book , only: [:show , :edit, :update, :destroy]

  def index
    @books = if params[:term]
      Book.where('title LIKE ?', "%#{params[:term]}%")
    else
      Book.all.order(created_at: :desc)
    end
  end
  def new
    @book = Book.new
  end

  def show
    @request = current_user.requests.find_by(book_id: @book.id)
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @book.update(book_params)
      redirect_to book_path(@book)
    else
      render 'edit'
    end
  end

  def destroy
    @book.destroy
    redirect_to root_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :publish_date, :author , :category , :number_of_pages)
  end
  def find_book
    @book = Book.find(params[:id])
  end


end
