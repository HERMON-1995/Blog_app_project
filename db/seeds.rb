# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


hermon = User.find_by(name: 'Hermon')
post = Post.create(author_id: hermon.id, title: 'Hello', text: 'This is my first post')

comment = Comment.create(author_id: hermon.id, post_id: post.id, text: 'I like the post!' )


# first_user = User.create(name: 'Amaka', photo: 'https://avatars.githubusercontent.com/u/105006208?v=4', bio: 'Teacher from Mexico.')
# second_user = User.create(name: 'Jaden', photo: 'https://avatars.githubusercontent.com/u/105528809?v=4', bio: 'Teacher from Poland.')

# first_post = Post.create(author_id: first_user.id, title: 'Hello', text: 'This is my first post')
# third_post = Post.create(author_id: first_user.id, title: 'cream de la cream', text: 'It is a pleasure')
# fourth_post = Post.create(author_id: first_user.id, title: 'kinetic', text: 'Boldly defined')
# fifth_post = Post.create(author_id: first_user.id, title: 'halooo', text: 'Nice to meet you')
# second_post = Post.create(author_id: second_user.id, title: 'Hi', text: 'This is my second post')
# third_post = Post.create(author_id: second_user.id, title: 'Hi there', text: 'Where are you from?')

# first_comment = Comment.create(author_id: first_user.id, post_id: first_post.id, text: 'Hi Tom!' )
# second_comment = Comment.create(author_id: second_user.id, post_id: second_post.id, text: 'Hi Jake')

# first_like = Like.create(author_id: second_user.id, post_id: first_post.id)
# second_like = Like.create(author_id: first_user.id, post_id: second_post.id)
