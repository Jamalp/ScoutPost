class CreatePosts < ActiveRecord::Migration
  def up
    create_table :posts do |t|
      t.string :title
      t.string :description
      t.string :href
      t.integer :score
      t.string :user
      t.string :user_href
      t.integer :comments_count
      t.integer :hn_post_id
      t.timestamps
    end
    add_index :posts, :id
    add_index :posts, :created_at
    add_index :posts, :updated_at

    execute "
    CREATE INDEX index_posts_gin_title ON posts USING GIN(to_tsvector('english', title));
    CREATE INDEX index_posts_gin_description ON posts USING GIN(to_tsvector('english', description));"
  end

  def down
    remove_index :posts, :id
    remove_index :posts, :created_at
    remove_index :posts, :updated_at
    execute "DROP INDEX index_posts_gin_title"
    execute "DROP INDEX index_posts_gin_description"
    drop_table :posts
  end
end