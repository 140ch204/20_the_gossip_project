class CreateTagLists < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_lists do |t|
	    t.references :tag, index: true
	    t.references :gossip, index: true
      t.timestamps
    end
  end
end
