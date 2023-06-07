class CartsController < ApplicationController
  before_action :authenticate_user!

  def index
    @cart = current_user.cart
    # @item_carts = ItemCart.where(cart: @cart)
    # @total = @item_carts.reduce(0){|sum, ic| sum + ic.item.price}.round(2)

  end
  
  def show
    @cart
  end

  # GET cart/id
  def new 
    @cart = Cart.new
  end

  # POST
  def create
    @cart = current_user.cart || Cart.new(user: current_user)
    @item = Item.find(params[:item_id])
  
    puts "Item ID: #{params[:item_id]}" # Add this line
  
    if @cart.cart_items.exists?(item: @item)
      flash[:error] = 'This item is already added in the cart.'
      redirect_to items_path
    else
      @cart_item = @cart.cart_items.build(item: @item)
      if @cart_item.save
        flash[:success] = 'Item added to cart successfully.'
        redirect_to carts_path
      else
        flash[:error] = 'An error occurred while adding the item to the cart.'
        redirect_to items_path
      end
    end
  end
  

  # DELETE 
  def destroy
    # @item_cart = ItemCart.find(params[:item_cart_id])
    if @item_cart.destroy
      flash[:success] = "Remove successfully an item"
    else
      flash[:error] = "An error has been occured!"
    end
    redirect_to carts_path

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_card
    @card = Cart.find(params[:id])
  end

  
end