class Post < ActiveRecord::Base
  has_and_belongs_to_many :subscribers
  has_and_belongs_to_many :tags
end