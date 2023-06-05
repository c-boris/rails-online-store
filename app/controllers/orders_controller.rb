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
    @order = Order.create(user: current_user)
    @cart = current_user.cart
    # item_carts = ItemCart.where(cart: @cart)
    # item_carts.each do |item_cart|
    #   # ItemOrder.create(item: item_cart.item, order: @order)
    #   item_cart.destroy
    # end
    redirect_to order_path(@order)
  end

  def destroy
  end

  def update
  end

 

end