class Tag < ApplicationRecord
	has_many :tag_lists		#Tag a une relation N-N avec Gossip
	has_many :gossips, through: :tag_lists
end
