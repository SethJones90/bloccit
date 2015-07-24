require 'faker'

#Create Posts
50.times do
	Post.create!(
		title: Faker::Lorem.sentence,
		body:  Faker::Lorem.paragraph
	)
end
posts = Post.all

#Create Comments
100.times do
	Comment.create!(
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

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
	
	