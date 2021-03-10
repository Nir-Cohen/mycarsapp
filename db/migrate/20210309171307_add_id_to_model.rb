class AddIdToModel < ActiveRecord::Migration[6.1]
  def change
    add_column :cars, :driver_id, :integer
  end
end
