class CreateTools < ActiveRecord::Migration[4.2]
  def change
    create_table :tools do |t|
      t.string :name
      t.integer :owner_id
      t.integer :borrower_id

      t.timestamps null: false
    end
  end
end
