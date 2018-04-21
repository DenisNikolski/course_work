class CreatePipeDescrs < ActiveRecord::Migration[5.1]
  def change
    create_table :pipe_descrs do |t|
      t.integer :diameter
      t.float :wall_thickness
      t.float :price
      t.belongs_to :pipe, foreign_key: true

      t.timestamps
    end
  end
end
