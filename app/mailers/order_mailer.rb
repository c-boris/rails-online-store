class OrderMailer < ApplicationMailer
  default from: 'hugo.rischmann@gmail.com'

  def order_confirmation(order)
    @order = order
    @url  = 'https://kitten-app-dev.herokuapp.com/'
    
    mail to: @order.email, subject: "Purrchase confirmation"
  end
end
