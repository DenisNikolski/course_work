class CreateRadiatorDescrs < ActiveRecord::Migration[5.1]
  def change
    create_table :radiator_descrs do |t|
      t.string :height
      t.string :length
      t.string :weight
      t.float :price
      t.belongs_to :radiator, foreign_key: true

      t.timestamps
    end
  end
end
