class CartsController < ApplicationController
  before_action :authenticate_user!

  def index
    @cart = current_user.cart
    @cart_total = calculate_cart_total(@cart) 
  end
  
  def show
    redirect_to carts_path
  end

  def new 
    @cart = Cart.new
  end

  def create
    @cart = current_user.cart || Cart.new(user: current_user)
    @item = Item.find(params[:item_id])
  
    existing_cart_item = @cart.cart_items.find_by(item: @item)
  
    if existing_cart_item
      existing_cart_item.update(quantity: existing_cart_item.quantity + 1)
      flash[:success] = 'Item quantity updated in the cart successfully.'
    else
      @cart_item = @cart.cart_items.build(item: @item)
      if @cart_item.save
        flash[:success] = 'Item added to cart successfully.'
      else
        flash[:error] = 'An error occurred while adding the item to the cart.'
      end
    end
  
    @cart_total = calculate_cart_total(@cart) # Calculate cart total
    redirect_to carts_path
  end
    

  # # DELETE 
  # def destroy
  #   # @item_cart = ItemCart.find(params[:item_cart_id])
  #   if @item_cart.destroy
  #     flash[:success] = "Remove successfully an item"
  #   else
  #     flash[:error] = "An error has been occured!"
  #   end
  #   redirect_to carts_path

  # end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_card
    @card = Cart.find(params[:id])
  end

  private

  def calculate_cart_total(cart)
    total = 0
    cart.cart_items.each do |cart_item|
      total += cart_item.item.price * cart_item.quantity
    end
    total
  end

  
end