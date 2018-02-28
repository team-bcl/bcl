require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
	let!(:user) { create(:user) }
	let!(:item) { create(:item) }
	let!(:cart_item) {create(:cart_item) }
	before do
		login_user user
	end
	describe 'GET#new' do
		before do
			get :new
		end
		it 'リクエストが200になること' do
			expect(response.status).to eq 200
		end
		it 'new.htmlが表示されること' do
			expect(response).to render_template :new
		end
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
			it 'データベースに登録されること' do
				expect{
					@order = attributes_for(:order)
					post :create, params:{ order: @order }
				}.to change(Order, :count).by(1)
			end
			it 'cart_item.order_idがupdateされること' do
				expect(CartItem.first.order_id).to eq 1
			end
			it 'total_priceがcount*priceになっていること' do
				expect(Order.first.total_price).to eq 6000
			end
		end
		context '無効なパラメータの場合' do
			before do
				@invalid_order = attributes_for(:invalid_order)
				post :create, params:{ order: @invalid_order }
			end
			it 'new_order_pathへリダイレクトすること' do
				expect(response).to redirect_to new_order_path
			end
			it 'データベースに登録されないこと' do
				expect{
					@invalid_order = attributes_for(:invalid_order)
					post :create, params:{ order: @invalid_order }
				}.not_to change(Order, :count)
			end
		end
	end
end