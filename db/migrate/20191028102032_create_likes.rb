class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
	    t.belongs_to :user, index: true
	    t.belongs_to :gossip, optional: true
	    t.belongs_to :comment, optional: true
	    t.timestamps
    end
  end
end
