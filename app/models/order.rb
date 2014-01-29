class Order < ActiveRecord::Base
	belongs_to :user
  	after_create :send_new_order_email

  def send_new_order_email
    OrderMailer.new_order(self, user).deliver!
  end
  
end
