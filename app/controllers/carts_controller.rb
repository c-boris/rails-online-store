class CartsController < ApplicationController
  before_action :authenticate_user!

  def index
    @cart = current_user.cart
  
    if !@cart
      @cart_total = 0
    else
      @cart_total = calculate_cart_total(@cart)
    end
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
    
 
  def destroy
    @cart = current_user.cart
    if @cart.destroy
      flash[:success] = "Remove successfully an item"
    else
      flash[:error] = "An error has been occured!"
    end
    redirect_to root_path
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