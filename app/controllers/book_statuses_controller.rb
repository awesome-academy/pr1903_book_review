class BookStatusesController < ApplicationController
  before_action :find_review , only: [:edit , :update , :destroy]

  def index
    @book_statuses = BookStatus.all.order(created_at: :desc)
  end

  def create
    @book_status = current_user.book_statuses.new(book_status_params)
    if @book_status.save
      redirect_to book_path(@book_status.book)
    end
  end

  def destroy
    @book_status.destroy
    redirect_to book_path(@book_status.book)
  end

  private
  def book_status_params
    params.require(:book_status).permit(:book_id)
  end
  # def find_book
  #   @book = Book.find(params[:book_id])
  # end
  # def find_user
  #   @user = User.find(params[:user_id])
  # end
  def find_bookstatus
    @book_status = BookStatus.find(params[:id])
  end
end
