class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :email
      t.string :name
      t.string :content
      t.integer :post_id
      t.integer :parents_id, default: 0

      t.timestamps
    end
  end
end
