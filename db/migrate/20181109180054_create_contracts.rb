class CreateContracts < ActiveRecord::Migration[5.2]
  def change
  	create_table :contracts do |t|
  		t.integer :tool_id
  		t.string  :loaner_name
  		t.integer :loaner_id
  		t.string  :borrower_name
  		t.integer :borrower_id
  	end
  end
end
