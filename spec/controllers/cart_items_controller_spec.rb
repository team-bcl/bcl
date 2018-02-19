require 'rails_helper'

RSpec.describe CartItemsController, type: :controller do
	let(:user) { create(:user) }
	before do
		login_user user
	end
	describe 'POST#create' do
		let(:item) { create(:item) }
		context '有効なパラメータの場合' do
			before do
				@cart_item = attributes_for(:cart_item)
				post :create, params:{ cart_item: @cart_item, item_id: item.id }
			end
			it 'root_pathへリダイレクトすること' do
				expect(response).to redirect_to root_path
			end
			it 'データベースに登録されること' do
				expect{
					@cart_item = attributes_for(:cart_item)
					post :create, params:{ cart_item: @cart_item, item_id: item.id }
				}.to change(CartItem, :count).by(1)
			end
			it 'item/stockが減ること' do
				expect(Item.first.stock).to eq 9
			end
		end
		context '無効なパラメータの場合' do
		end
	end
	describe 'DELETE#destroy' do
		let!(:item) { create(:item) } 
		let(:cart_item) { create(:cart_item) }
		before do
			delete :destroy, params:{ id: cart_item.id }
		end
		it 'リクエストが302になること' do
			expect(response.status).to eq 302
		end
		it 'データベースから削除されること' do
			expect{
				delete :destroy, params:{ id: cart_item.id }
			}.to raise_exception(ActiveRecord::RecordNotFound)
		end
		it 'item/stockが増えること' do
			expect(Item.first.stock).to eq 11
		end
	end
end