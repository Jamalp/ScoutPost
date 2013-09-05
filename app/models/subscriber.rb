class Subscriber < ActiveRecord::Base
  has_and_belongs_to_many :posts
  has_many :favorites
  has_many :tags, through: :favorites

  devise :database_authenticatable, :registerable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable#, :confirmable
end
