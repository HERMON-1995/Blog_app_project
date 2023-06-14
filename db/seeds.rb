# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(name: 'Tom', photo: 'https://otkritkis.com/wp-content/uploads/2021/12/original-5-4.jpg', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: 'https://cdn140.picsart.com/268677411009201.png', bio: 'Teacher from Poland.')
third_user = User.create(name: 'Ana', photo: 'https://yt3.ggpht.com/ytc/AKedOLTQyz4Tycr1goerUWaMMCU3NNlvEAUlx4EzKF9Qww=s900-c-k-c0x00ffffff-no-rj', bio: 'Teacher from Poland.')
fourth_user = User.create(name: 'Jaden', photo: 'https://www.gkristianhansenorthodontics.com/wp-content/uploads/2018/07/Healthy_Bite_Bozeman_MT_Orthodontist.jpg', bio: 'Teacher from Poland.')

first_post = Post.create(author_id: first_user.id, title: 'Hello', text: 'This is my first post')
third_post = Post.create(author_id: first_user.id, title: 'cream de la cream', text: 'It is a pleasure')
fourth_post = Post.create(author_id: first_user.id, title: 'kinetic', text: 'Boldly defined')
fifth_post = Post.create(author_id: first_user.id, title: 'halooo', text: 'Nice to meet you')
second_post = Post.create(author_id: second_user.id, title: 'Hi', text: 'This is my second post')
third_post = Post.create(author_id: second_user.id, title: 'Hi there', text: 'Where are you from?')

first_comment = Comment.create(author_id: first_user.id, post_id: first_post.id, text: 'Hi Tom!' )
second_comment = Comment.create(author_id: second_user.id, post_id: second_post.id, text: 'Hi Jake')

first_like = Like.create(author_id: second_user.id, post_id: first_post.id)
second_like = Like.create(author_id: first_user.id, post_id: second_post.id)
