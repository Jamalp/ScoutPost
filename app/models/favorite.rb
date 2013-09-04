class Favorite < ActiveRecord::Base
  belongs_to :subscriber
  belongs_to :tag
end
