class AddYearToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :year, :integer
  end
end
