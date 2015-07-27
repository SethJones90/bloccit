require 'faker'
 
# Create Users
5.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end
users = User.all

#Create Posts
50.times do
	Post.create!(
		user:  users.sample,
		title: Faker::Lorem.sentence,
		body:  Faker::Lorem.paragraph
	)
end
posts = Post.all

#Create Comments
100.times do
	Comment.create!(
		# user: users.sample,   # we have not yet associated Users with Comments
		post: posts.sample,
		body: Faker:: Lorem.paragraph
	)
end

#Unique Post
1.times do
	Post.create!(
		title: "Unique post",
		body: "I am a unique post")
end

#Unique Comment
1.times do
	Comment.create!(
		post: posts.sample,
		body: "I am a unique comment"
	)
end

#Create Advertisement
1.times do
	Advertisement.create!(
		title: "Unique Advertisement",
		copy:  "I am a unique advertisment. Buy stuff.",
		price: "1"
	)
end

 user = User.first
 user.skip_reconfirmation!
 user.update_attributes!(
   email: 'sethjmusic@gmail.com',
   password: 'helloworld'
 )

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
	
	