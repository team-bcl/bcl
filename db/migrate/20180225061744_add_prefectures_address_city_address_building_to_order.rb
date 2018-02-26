class AddPrefecturesAddressCityAddressBuildingToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :prefectures, :integer
    add_column :orders, :address_city, :string
    add_column :orders, :address_building, :string
  end
end
