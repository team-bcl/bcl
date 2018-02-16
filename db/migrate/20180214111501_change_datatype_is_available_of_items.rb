class ChangeDatatypeIsAvailableOfItems < ActiveRecord::Migration[5.1]
	def change
		change_column(:items, :is_available, :integer)
	end
end
