class OrdersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @orders = current_user.orders
  end

  def show
    @order = Order.find(params[:id])
    # @item_orders = ItemOrder.where(order: @order)
  end


  def create

    # Before the rescue, at the beginning of the method
    @stripe_amount = 500
    begin
      customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
      })
      charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @stripe_amount,
      description: "Achat d'un produit",
      currency: 'eur',
      })
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_order_path
    end
    # After the rescue, if the payment succeeded

    # @order = Order.create(user: current_user)
    # @cart = current_user.cart
    # # item_carts = ItemCart.where(cart: @cart)
    # # item_carts.each do |item_cart|
    # #   # ItemOrder.create(item: item_cart.item, order: @order)
    # #   item_cart.destroy
    # # end
    # redirect_to order_path(@order)
    
    OrderMailer.order_confirmation(@order).deliver_now
  end

  def destroy
  end

  def update
  end

  def order_params
    params.require(:order).permit(:order_total)
  end

 

end