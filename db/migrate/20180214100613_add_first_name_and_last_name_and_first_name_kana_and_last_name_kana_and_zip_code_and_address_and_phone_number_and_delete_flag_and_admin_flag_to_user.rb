class AddFirstNameAndLastNameAndFirstNameKanaAndLastNameKanaAndZipCodeAndAddressAndPhoneNumberAndDeleteFlagAndAdminFlagToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :first_name_kana, :string
    add_column :users, :last_name_kana, :string
    add_column :users, :zip_code, :string
    add_column :users, :address, :string
    add_column :users, :phone_number, :string
    add_column :users, :delete_flag, :boolean
    add_column :users, :admin_flag, :boolean
  end
end
