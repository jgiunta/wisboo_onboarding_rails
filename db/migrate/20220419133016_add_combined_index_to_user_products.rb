class AddCombinedIndexToUserProducts < ActiveRecord::Migration
  def change
    add_index :user_products, [:user_id, :product_id], unique: true
  end
end
