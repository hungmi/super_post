# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
include ZhLorem::Helpers
i = 1
for i in 1..5 do
  @user = User.create(
    uid: rand(10000..99999),
    provider: 'facebook',
    name: zh_lorem_name,
    contact: zh_lorem_words(rand(3..7))
    )
  for j in 1..3 do
    @user.posts.create(city: I18n.t('cities').values[rand(0..20)], address: zh_lorem_words(rand(15..20)), price: rand(43..189)*100, description: zh_lorem_paragraphs(1), post_type: rand(0..2), state: rand(0..2))
  end
end