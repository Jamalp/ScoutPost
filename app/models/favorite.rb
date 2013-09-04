class Favorite < ActiveRecord::Base
  belongs_to :subscribers
  belongs_to :tags
end
