class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items

  after_create :order_send

  def order_send
    OrderMailer.order_confirmation(user, self).deliver_now
  end  
end
