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
    @cart = Cart.find(current_user.cart.id)
    @item = Item.find(params[:item_id])

    # Check item is already in card
    check_item = ItemCart.find_by(item: @item, cart: @cart);
    if !check_item.nil?
      flash[:error] = "This item is already added in cart."
      return redirect_to items_path
    end
    # item_cart = ItemCart.new(cart: @cart, item: @item)
    if item_cart.save
      redirect_to items_path
      flash[:success] = "Update an item in cart sucessfully."
    else
      redirect_to items_path
      flash[:error] = "Some error has been occured."
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