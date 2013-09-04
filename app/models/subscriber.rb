class Subscriber < ActiveRecord::Base
  has_many :tags, through: :favorites

  devise :database_authenticatable, :registerable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable#, :confirmable
end
