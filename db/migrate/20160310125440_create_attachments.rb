class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.references :imageable, polymorphic: true, index: true
      t.string :image
      t.text :description
      t.integer :order
      t.string :theta_url
      t.integer :room_id
      t.boolean :cover, default: false
      t.string :token

      t.timestamps null: false
    end
  end
end
