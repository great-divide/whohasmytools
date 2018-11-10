class CreateTools < ActiveRecord::Migration[4.2]
  def change
    create_table :tools do |t|
      t.string  :name
      t.string  :description
      t.integer :user_id
      

      t.timestamps null: false
    end
  end
end
