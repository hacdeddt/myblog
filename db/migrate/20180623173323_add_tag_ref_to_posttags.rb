class AddTagRefToPosttags < ActiveRecord::Migration[5.1]
  def change
    add_reference :posttags, :tag, foreign_key: true
  end
end
