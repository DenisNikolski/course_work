class CreateValveDescrs < ActiveRecord::Migration[5.1]
  def change
    create_table :valve_descrs do |t|
      t.float :radius
      t.float :pressure
      t.float :max_temperature
      t.belongs_to :valve, foreign_key: true
      t.float :price

      t.timestamps
    end
  end
end
