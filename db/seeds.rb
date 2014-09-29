# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.create email: "ford_prefect@beteugeuse.com",
                   password: "abc123",
                   password_confirmation: "abc123"
100.times do |forum_thread_i|
  ForumThread.create user_id: user.id, subject: "Teste topido nro #{forum_thread_i}"
end
