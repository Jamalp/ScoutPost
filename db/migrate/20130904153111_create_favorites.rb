class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.belongs_to :subscriber
      t.belongs_to :tag
      t.integer :score_threshold, default: 80
    end
    add_index :favorites, [:subscriber_id, :tag_id], unique: true
  end
end