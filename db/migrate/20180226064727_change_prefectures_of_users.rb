class ChangePrefecturesOfUsers < ActiveRecord::Migration[5.1]
  def change
  	change_column(:users, :prefectures, :integer)
  end
end
