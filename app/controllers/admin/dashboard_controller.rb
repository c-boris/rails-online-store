class Admin::DashboardController < ApplicationController
  def index
    @total_orders_sold = Order.where.not(id: nil).count
  end

  def index
    @average_price_sold = Item.where.not(price: nil).average(:price)
  end

  def new_product
    @item = Item.new
  end

  def create_product
    @item = Item.new(item_params)
  
    if @item.save
      redirect_to admin_dashboard_path, notice: 'Le produit a été créé avec succès.'
    else
      render :new_product
    end
  end

  # ...

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :image_url)
  end

end
