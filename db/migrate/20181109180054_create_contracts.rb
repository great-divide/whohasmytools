class CreateContracts < ActiveRecord::Migration[5.2]
  def change
  	create_table :contracts do |t|
  		t.integer :tool_id
  		t.integer :loaner_id
  		t.integer :borrower_id
  		t.string  :loaner_name
  		t.string  :borrower_name
  		t.boolean :active
  		t.timestamps null: false
  	end
  end
end
