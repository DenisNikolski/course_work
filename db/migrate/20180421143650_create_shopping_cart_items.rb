class CreateShoppingCartItems < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_cart_items do |t|
      t.integer :category_id
      t.integer :product_id
      t.integer :product_item_id
      t.integer :amount
      t.float :price
      t.belongs_to :shopping_cart, foreign_key: true
      t.timestamps
    end
  end
end
