class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.integer :mom_id

      t.timestamps null: false
    end
  end
end
