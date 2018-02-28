require 'rails_helper'

RSpec.describe CartItemsController, type: :controller do
	let!(:user) { create(:user) }
	let!(:item) { create(:item) }
	before do
		login_user user
	end
	describe 'POST#create' do
		context '有効なパラメータの場合' do
			before do
				@cart_item = attributes_for(:cart_item)
				post :create, params:{ cart_item: @cart_item, item_id: item.id }
			end
			it 'root_pathへリダイレクトすること' do
				expect(response).to redirect_to cart_items_path
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
			before do
				@invalid_cart_item = attributes_for(:invalid_cart_item)
				post :create, params:{ cart_item: @invalid_cart_item, item_id: item.id }
			end
			it 'item_pathへリダイレクトすること' do
				expect(response).to redirect_to item_path(id: item.id)
			end
			it 'データベースに登録されないこと' do
				expect{
					@invalid_cart_item = attributes_for(:invalid_cart_item)
					post :create, params:{ cart_item: @invalid_cart_item, item_id: item.id} 
				}.not_to change(Item, :count)
			end
			it 'item/stockが減らないこと' do
				expect(Item.first.stock).to eq 10
			end
		end
	end
	describe 'PATCH#update' do
		let!(:cart_item) { create(:cart_item) }
		before do
			@cart_item = attributes_for(:cart_item, count:3)
			patch :update, params:{ cart_item: @cart_item, item_id: item.id, id: cart_item.id }
		end
		it 'リクエストが302になること' do
			expect(response.status).to eq 302
		end
		it 'Itemの個数が変更されていること' do
			expect(Item.first.stock).to eq 8
		end
	end
	describe 'DELETE#destroy' do 
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
	describe 'GET#index' do
		before do
			get :index
		end
		it 'リクエストが200になること' do
			expect(response.status).to eq 200
		end
		it 'index.htmlが表示されること' do
			expect(response).to render_template :index
		end
	end
end