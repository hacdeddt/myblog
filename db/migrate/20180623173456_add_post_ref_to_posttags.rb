class AddPostRefToPosttags < ActiveRecord::Migration[5.1]
  def change
    add_reference :posttags, :post, foreign_key: true
  end
end
