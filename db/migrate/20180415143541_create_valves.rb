class CreateValves < ActiveRecord::Migration[5.1]
  def change
    create_table :valves do |t|
      t.string :title
      # t.integer :category_id
      t.string :img_src
      t.belongs_to :category, foreign_key: true
      t.timestamps
    end
  end
end
