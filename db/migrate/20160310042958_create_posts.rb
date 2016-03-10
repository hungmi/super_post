class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :address
      t.decimal :price
      t.text :description
      t.integer :post_type, default: 0
      t.integer :user_id
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end
