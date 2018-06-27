class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.text :summary
      t.string :image
      t.boolean :publish
      t.string :slug
      t.integer :user_id

      t.timestamps
    end
  end
end
