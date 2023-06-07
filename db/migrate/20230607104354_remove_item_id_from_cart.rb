class RemoveItemIdFromCart < ActiveRecord::Migration[7.0]
  def change
    remove_column :carts, :item_id
  end
end
