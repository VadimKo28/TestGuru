class ReviewsController < ApplicationController
  def new
  end

  def create
    ReviewsMailer.send_reviews(email: params[:email], body: params[:body]).deliver_now
    redirect_to new_review_path, notice: 'Ваше сообщение отправлено!'
  end

  private

  def reviews_params
    params.require(:reviews).permit(:body, :email)
  end
end
