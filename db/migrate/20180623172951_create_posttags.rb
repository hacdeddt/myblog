class CreatePosttags < ActiveRecord::Migration[5.1]
  def change
    create_table :posttags do |t|

      t.timestamps
    end
  end
end
