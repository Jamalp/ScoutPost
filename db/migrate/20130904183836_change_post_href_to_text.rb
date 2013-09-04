class ChangePostHrefToText < ActiveRecord::Migration
  def self.up
   change_column :posts, :href, :text
  end

  def self.down
   change_column :posts, :href, :string
  end
end
