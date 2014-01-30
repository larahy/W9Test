class OrderMailer < ActionMailer::Base
  default from: "larahy@gmail.com"

  def new_order(order, user)
    @order = order
    mail to: user.email, subject: order.product
  end
  
end
