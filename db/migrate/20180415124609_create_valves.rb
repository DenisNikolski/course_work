class CreateValves < ActiveRecord::Migration[5.1]
  def change
    create_table :valves do |t|
      t.string :title
      t.integer :category
      t.string :img_src

      t.timestamps
    end
  end
end
