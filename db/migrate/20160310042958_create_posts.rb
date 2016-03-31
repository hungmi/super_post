class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      # When Post is House
      t.string :city
      t.string :address
      t.integer :price
      t.text :description
      t.integer :state, default: 0
      t.integer :availability, default: 0
      t.integer :post_type, default: 0

      # Must Have
      t.belongs_to :author
      t.string :token
      t.integer :attachments_count, default: 0

      t.timestamps null: false
    end
  end
end
