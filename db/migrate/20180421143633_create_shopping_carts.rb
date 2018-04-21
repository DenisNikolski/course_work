class CreateShoppingCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_carts do |t|
      t.belongs_to :customer, foreign_key: true
      t.string :status
      t.timestamps
    end
  end
end
