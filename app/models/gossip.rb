class Gossip < ApplicationRecord
	has_many :tag_lists 		#Gossip en relation N-1 avec User et en relation 1-N avec Comment et Like, et en relation N-N avec Tags
	has_many :tags, through: :tag_lists
	belongs_to :user
	has_many :comments
	has_many :likes


  # ___________new_____#

	validates :title, presence: {message: "Il manque un titre"}
	validates :title, uniqueness: {value:true, message: "Ce titre est déja pris"}
	validates :title, length: {minimum: 3, maximum: 20, message: "Le titre doit être entre 3 et 20 caractères"}

	validates :content, presence: {message: "Il manque le contenu"}
	validates :content, length: {minimum: 20, message: "Le contenu doit être de 20 caractères minimum"}


end
