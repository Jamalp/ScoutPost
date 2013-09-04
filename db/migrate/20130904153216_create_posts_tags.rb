class CreatePostsTags < ActiveRecord::Migration
  def change
    create_table :posts_tags do |t|
      t.belongs_to :post
      t.belongs_to :tag
    end
    add_index :posts_tags, [:post_id, :tag_id], unique: true
  end
end