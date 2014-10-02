# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10000.times do |forum_thread_i|
  parent = ForumThread.create subject: "Teste topico nro #{forum_thread_i}"
  child = ForumThread.create(subject: "resp do topico #{forum_thread_i}", parent_thread: parent)
end
