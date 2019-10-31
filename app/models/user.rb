class User < ApplicationRecord
	belongs_to :city		#User est en relation N-1 avec City, en relation 1-N avec Like, comment ,gossip et privatemessage et en relation N-N avec private message
	has_many :gossips
	has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
	has_many :recipients
	has_many :private_messages, through: :recipients
	has_many :comments
  has_many :likes
  
  has_secure_password

	validates :first_name, presence:  {message: "Merci de saisir ton prénom ?"}
	validates :last_name, presence:  {message: "Merci de saisir ton nom ?"}

	validates :description, presence:  {message: "Merci de saisir une description ?"}
	validates :description, length: {minimum: 20, message: "La description est trop courte."}

	validates :email, presence:  {message: "Merci de saisir ton email ?"}
	validates :email, uniqueness: true
	validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Il y a une faute dans l'email" }


end
