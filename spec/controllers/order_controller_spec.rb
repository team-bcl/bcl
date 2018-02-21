require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
	let!(:user) { create(:user) }
	let!(:item) { create(:item) }
	let!(:cart_item) {create(:cart_item) }
	before do
		login_user user
	end
	describe 'POST#create' do
		context '有効なパラメータの場合' do
			before do 
				@order = attributes_for(:order)
				post :create, params:{ order: @order }
			end
			it 'root_pathへリダイレクトすること' do
				expect(response).to redirect_to root_path
			end
		end
	end
end