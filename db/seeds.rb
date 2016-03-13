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
  Post.create(author: zh_lorem_name, contact: rand(1234567890..9999999999), city: I18n.t('cities').values[rand(0..20)], address: zh_lorem_words(rand(15..20)), price: rand(43..189)*100, description: zh_lorem_paragraphs(1), post_type: rand(0..2), state: rand(0..1))
  i = i + 1
end