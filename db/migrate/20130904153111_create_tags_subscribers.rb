class CreateTagsSubscribers < ActiveRecord::Migration
  def change
    create_table :tags_subscribers do |t|
      t.belongs_to :tag
      t.belongs_to :subscriber
      t.integer :score_threshold, default: 80
    end
    add_index :tags_subscribers, [:tag_id, :subscriber_id], unique: true
  end
end