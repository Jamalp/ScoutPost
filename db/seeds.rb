# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

tags = ['ruby', 'rails', 'javascript', 'apple', 'google', 'android', 'js']

tags.each do |tag|
  Tag.find_or_create_by(name: tag)
end