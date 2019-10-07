class RequestsController < ApplicationController
  before_action :find_request , only: [:edit , :update , :destroy]

  def create
    @request = current_user.requests.new(request_params)
    @request.status = 0
    if @request.save
      redirect_to book_path(@request.book)
    end
  end

  def index
    @requests = Request.all.order(created_at: :desc)
  end

  def destroy
    @request.destroy
    redirect_to book_path(@request.book)
  end

  private
  def request_params
    params.require(:requests).permit(:book_id, :user_id)
  end

  def find_request
    @request = Request.find(params[:id])
  end

end
