class Item < ApplicationRecord
  has_many :cart_items
  has_many :carts, through: :cart_items
  has_many :order_items
  has_many :orders, through: :order_items
  has_one_attached :item_picture

  # def image_url
  #   if item_picture.attached?
  #     item_picture.
  #   else
  #     # Retournez une URL d'image de remplacement ou un chemin vers une image par défaut
  #     # si aucune image n'est attachée.
  #   end
  # end
end