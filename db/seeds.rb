# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create( email: 'martionlee@gmail.com', password: '123456' )
user = User.first
user.add_role :admin

user = User.create( email: 'leejoonsoo95@naver.com', password: '123456' )
user = User.second
user.add_role :admin

today_sentence = TodaySentence.create( date: '2019/06/19', body: '오늘 하루 정말 수고했어!' )
today_sentence = TodaySentence.create( date: '2019/06/20', body: '아침에 잘 일어났구나' )