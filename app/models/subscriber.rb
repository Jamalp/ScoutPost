class Subscriber < ActiveRecord::Base
  has_and_belongs_to_many :tags

  devise :database_authenticatable, :registerable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable, :confirmable
end
