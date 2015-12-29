class CreateToys < ActiveRecord::Migration
  def change
    create_table :toys do |t|
      t.string :kind
      t.string :color
      t.integer :child_id

      t.timestamps null: false
    end
  end
end
