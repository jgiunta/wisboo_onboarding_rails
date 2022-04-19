class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :image
      t.integer :quantity
      t.text :description

      t.timestamps null: false
    end
  end
end
