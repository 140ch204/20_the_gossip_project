class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
	    t.string :first_name
	    t.string :last_name
	    t.string :email
	    t.integer :age
	    t.text :description
	    t.references :city, index: true
	
	    t.timestamps
    end
  end
end
