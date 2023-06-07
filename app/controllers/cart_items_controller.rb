class CartItemsController < ApplicationController
  def index 
	end
	def create
    cart = current_user.cart
    item = Item.find(params[:item])
		NewCartItem.new(cart, item).perform
		redirect_to cart_path(cart)
  end

  def edit
  end

  def update
  end


  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    flash[:success] = 'Item removed from cart successfully.'
    redirect_to cart_path
  end
  
end
