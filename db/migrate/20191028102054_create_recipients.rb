class CreateRecipients < ActiveRecord::Migration[5.2]
  def change
    create_table :recipients do |t|
	    t.references :user, index: true
	    t.references :private_message, index: true

      t.timestamps
    end
  end
end
