class CreatePipes < ActiveRecord::Migration[5.1]
  def change
    create_table :pipes do |t|
      t.string :title
      t.integer :category_id
      t.string :img_src

      t.timestamps
    end
  end
end
