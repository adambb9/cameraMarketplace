class CreateLenses < ActiveRecord::Migration[6.1]
  def change
    create_table :lenses do |t|
      t.string :category
      t.string :make
      t.string :type
      t.text :lens_mount
      t.float :diameter
      t.decimal :price
      t.text :condition
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
