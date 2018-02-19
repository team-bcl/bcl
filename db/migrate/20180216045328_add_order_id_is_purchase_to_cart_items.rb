class AddOrderIdIsPurchaseToCartItems < ActiveRecord::Migration[5.1]
  def change
    add_column :cart_items, :order_id, :integer,default: 0
    add_column :cart_items, :is_purchase, :boolean,default: true
  end
end
