class Recipient < ApplicationRecord
	belongs_to :private_message   #Recipient fait la liaison N-N entre privatemessage et user pour les receveurs
	belongs_to :user
end
