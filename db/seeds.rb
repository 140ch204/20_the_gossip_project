# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

10.times do		#cree 10 villes
	City.create(name: Faker::Address.city, zip_code: Faker::Address.zip)
end

10.times do		#cree 10 user avec une ville en reference
	User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Quote.famous_last_words, email: Faker::Internet.email, age: rand(18..99), city: City.all.sample)
end

20.times do |index|	#cree 20 gossip en reference avec user
	Gossip.create(title: "Gossip#{index}",content: Faker::ChuckNorris.fact, user: User.all.sample)
end

10.times do 		#cree 10 tag
	Tag.create(title: "##{Faker::Games::Pokemon.name}")
end

1.upto(20) do |index|		#Fait la relation de 20 gossips avec des tags
	TagList.create(gossip: Gossip.find(index), tag: Tag.all.sample)	
end

20.times do	#creer 20 messages en reference avec l'utilsateur sender et creer un nombre aleatoire de receveur user
	message = PrivateMessage.create(sender: User.all.sample, content: Faker::Movies::HarryPotter.quote)
	rand(1..6).times do
		Recipient.create(private_message: message, user: User.all.sample)
	end
end

20.times do		#cree 20 comments
	Comment.create(content: Faker::Movies::Hobbit.quote, user: User.all.sample, gossip: Gossip.all.sample)
end

20.times do 		#creer 20 like qui est de maniere aleatoire un like de comment ou de gossip
	if rand(0..10)%2==0 
		Like.create(user: User.all.sample, gossip: Gossip.all.sample)
	else
		Like.create(user: User.all.sample, comment: Comment.all.sample)
	end
end

puts "all entries added"