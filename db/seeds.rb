# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Tag.destroy_all
Tag.create(name: "javascript")
Tag.create(name: "objective-c")
Tag.create(name: "c++")
Tag.create(name: "ruby on rails")
Tag.create(name: "angular js")
Tag.create(name: "node")
Tag.create(name: "django")

