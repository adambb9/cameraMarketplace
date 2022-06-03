class CreateAccessories < ActiveRecord::Migration[6.1]
  def change
    create_table :accessories do |t|
      t.string :category
      t.string :make
      t.text :condition
      t.decimal :price

      t.timestamps
    end
  end
end
