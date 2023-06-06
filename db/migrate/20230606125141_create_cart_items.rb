class CreateCartItems < ActiveRecord::Migration[7.0]
  def change
    create_table :cart_items do |t|
      t.references :cart, foreign_key: true
      t.references :item, foreign_key: true
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end

    remove_index :cart_items, name: "index_cart_items_on_cart_id"
    remove_index :cart_items, name: "index_cart_items_on_item_id"

    add_index :cart_items, :cart_id, name: "index_cart_items_on_cart_id"
    add_index :cart_items, :item_id, name: "index_cart_items_on_item_id"
  end
end
