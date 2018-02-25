class RemoveAddressToOrder < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :address, :string
  end
end
