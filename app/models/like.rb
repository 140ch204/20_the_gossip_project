class Like < ApplicationRecord
	belongs_to :user		#Like est en relation N-1 avec User, comment et Gossip et dont ces 2 derniers sont optionnels
	belongs_to :comment, optional: true
	belongs_to :gossip, optional: true
end
