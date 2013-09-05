class AddTimeColumnToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :submission, :timestamp
  end
end
