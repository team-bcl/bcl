class RenameAddressColumnToUsers < ActiveRecord::Migration[5.1]
  def change
  	rename_column :users, :address, :prefectures
  end
end
