class ReviewsMailer < ApplicationMailer
  def send_reviews(email: ,body:)
    @email = email
    @body = body 
    mail to: 'admin_test_gury@mail.ru', subject: 'Новое сообщение обратной связи'
  end
end
