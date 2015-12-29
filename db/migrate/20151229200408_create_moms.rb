class CreateMoms < ActiveRecord::Migration
  def change
    create_table :moms do |t|
      t.string :name
      t.integer :age
      t.string :job

      t.timestamps null: false
    end
  end
end
