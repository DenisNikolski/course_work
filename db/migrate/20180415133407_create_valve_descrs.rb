class CreateValveDescrs < ActiveRecord::Migration[5.1]
  def change
    create_table :valve_descrs do |t|
      t.float :radius
      t.float :pressure
      t.float :max_temperature
      t.integer :valve_id
      t.float :price

      t.timestamps
    end
  end
end
