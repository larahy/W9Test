class ChargesController < ApplicationController
	 before_filter :authenticate_user!

  def new
    @story = Story.find(params[:story_id])
  end

  def create
    @story = Story.find params[:story_id]
    @amount = @story.price * 100

    customer = Stripe::Customer.create(
    :email => current_user.email,
    :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => '@story.title',
    :currency    => 'gbp'
    )

    @order = Order.create(user_id: current_user.id, amount: @amount, product: @story.title)

    flash[:notice] = "Je ne regrette rien"
    redirect_to '/stories'

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end

end

end
