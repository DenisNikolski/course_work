class CreateRadiators < ActiveRecord::Migration[5.1]
  def change
    create_table :radiators do |t|
      t.string :title
      t.integer :category
      t.string :img_src

      t.timestamps
    end
  end
end
