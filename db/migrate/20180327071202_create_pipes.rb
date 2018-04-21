class CreatePipes < ActiveRecord::Migration[5.1]
  def change
    create_table :pipes do |t|
      t.string :title
      t.belongs_to :category, foreign_key: true
      t.string :img_src
      t.timestamps
    end
  end
end
