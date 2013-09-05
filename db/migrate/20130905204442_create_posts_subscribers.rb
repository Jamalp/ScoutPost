class CreatePostsSubscribers < ActiveRecord::Migration
  def change
    create_table :posts_subscribers do |t|
      t.belongs_to :post
      t.belongs_to :subscriber
    end
    add_index :posts_subscribers, [:post_id, :subscriber_id], unique: true
  end
end
