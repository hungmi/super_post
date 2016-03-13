class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :city
      t.string :address
      t.integer :price
      t.text :description
      t.integer :state, default: 0
      t.integer :availability, default: 0
      t.integer :post_type, default: 0
      t.string :author
      t.string :contact
      t.string :token
      t.integer :attachments_count

      t.timestamps null: false
    end
  end
end
