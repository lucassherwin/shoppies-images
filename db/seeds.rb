# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Post.destroy_all

user = User.create(username: 'test', password: 'test')
post = Post.create(
    title: 'test title',
    description: 'test description',
    points: 5,
    tag: 'test',
    user_id: user.id
)

post.images.attach(
    io: File.open('./public/images/shrek.png'),
    filename: 'shrek.png',
    content_type: 'application/png'
)