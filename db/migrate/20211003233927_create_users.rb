class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.string :email
      t.integer :role
      t.string :password_digest
    end
  end
end
