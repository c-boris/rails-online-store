class OrderMailer < ApplicationMailer
  default from: 'hugo.rischmann@gmail.com'

  def order_confirmation(user, order)
    @user = user
    @order = order
    @url  = 'https://kitten-app-dev.herokuapp.com/'
    
    mail(to: @order.user.email, subject: "Purrchase confirmation")
  end
end
