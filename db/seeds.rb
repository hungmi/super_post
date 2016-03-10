# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
include ZhLorem::Helpers
i = 1
for i in 1..13 do
  Post.create(address: ZhLorem.sentence, price: rand(4323..18989), description: zh_lorem_paragraphs(1), post_type: rand(0..2), status: rand(0..1))
  i = i + 1
end