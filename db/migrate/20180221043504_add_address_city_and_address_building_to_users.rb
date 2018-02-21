class AddAddressCityAndAddressBuildingToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :address_city, :string
    add_column :users, :address_building, :string
  end
end
