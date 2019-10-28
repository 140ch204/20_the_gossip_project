class User < ApplicationRecord
	belongs_to :city		#User est en relation N-1 avec City, en relation 1-N avec Like, comment ,gossip et privatemessage et en relation N-N avec private message
	has_many :gossips
	has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
	has_many :recipients
	has_many :private_messages, through: :recipients
	has_many :comments
	has_many :likes
end
