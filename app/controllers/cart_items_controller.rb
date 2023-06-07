class CartItemsController < ApplicationController

	def create
    cart = current_user.cart
    item = Item.find(params[:item])
		NewCartItem.new(cart, item).perform
		redirect_to cart_path(cart)
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_path, notice: "Item removed from cart."
  end

end
