class CreateDrivers < ActiveRecord::Migration[6.1]
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :email
      t.string :dateOfBirth
      t.string :cars_id
      
      t.timestamps
    end
  end
end
