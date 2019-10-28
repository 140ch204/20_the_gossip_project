class TagList < ApplicationRecord
	belongs_to :gossip	#TagList fait la relatin N-N entre Tag et Gossip
	belongs_to :tag
end
