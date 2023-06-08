class CheckoutController < ApplicationController
  
  def create
    @total = current_user.cart.cart_items.sum { |cart_item| cart_item.item.price * cart_item.quantity }

    Stripe.api_key = "sk_test_51NFxRLHuW4CpX6vqLT6AM0nPf7qZwDvFcrKwTRDgv0oDf0lJeCq5xBUlSkYhCmX3WREyVH0pR21El1xyyuiJ5oRs00ylqVHJF0"

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [
        {
          price_data: {
            currency: 'eur',
            unit_amount: (@total*100).to_i,
            product_data: {
              name: 'Rails Stripe Checkout',
            },
          },
          quantity: 1
        },
      ],
      mode: 'payment',
      success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: checkout_cancel_url
    )
    redirect_to @session.url, allow_other_host: true
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)

    @total = current_user.cart.cart_items.sum { |cart_item| cart_item.item.price * cart_item.quantity }

    order = Order.create!(user_id: current_user.id, order_total: @total)

    cart_items = current_user.cart.cart_items
  
    cart_items.each do |cart_item|
      OrderItem.create!(
        order_id: order.id,
        item_id: cart_item.item_id,
        quantity: cart_item.quantity
      )
    end
  
    current_user.cart.cart_items.destroy_all

    # Redirect or render a success page
    redirect_to order_path(order) # Assuming you have an `order_path` route and an `OrderController` to handle showing the order details

  end

  def cancel
  end

end