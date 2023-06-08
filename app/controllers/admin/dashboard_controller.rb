class Admin::DashboardController < ApplicationController
  def index
    @total_orders_sold = Order.where.not(id: nil).count
  end

  def index
    @average_price_sold = Item.where.not(price: nil).average(:price)
  end

end
