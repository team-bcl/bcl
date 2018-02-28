require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
	let!(:user) { create(:user) }
	let!(:admin) { create(:admin) }
	describe 'GET#new' do
		context 'admin' do
			before do
				login_user admin
				get :new
			end
			it 'リクエストが200になること' do
				expect(response.status).to eq 200
			end
			it '@itemにパラメータを割り当てること' do
				expect(assigns(:item)).to be_a_new(Item)
			end
		end
		context 'user' do
			before do
				login_user user
				get :new
			end
			it 'リクエストが302になること' do
				expect(response.status).to eq 302
			end
		end
	end
	describe 'POST#create' do
		context 'admin' do
			before do
				login_user admin
			end
			context '有効なパラメータの場合' do
				before do
					@item = attributes_for(:item)
					post :create, params:{ item: @item }
				end
				it 'root_pathへリダイレクトすること' do
					expect(response).to redirect_to root_path
				end
				it 'データベースに登録されること' do
					expect{
						post :create, params:{ item: @item}
					}.to change(Item, :count).by(1)
				end
			end
			context '無効なパラメータの場合' do
				before do 
					@invalid_item = attributes_for(:invalid_item)
					post :create, params:{ item: @invalid_item }
				end
				it 'new_item_pathへリダイレクトすること' do
					expect(response).to redirect_to new_item_path
				end
				it 'データベースに登録されないこと' do
					expect{
						post :create, params:{ item: @invalid_item}
					}.not_to change(Item, :count)
				end
			end
		end
		context 'user' do
			before do
				login_user user
				@item = attributes_for(:item)
				post :create, params:{ item: @item }
			end
			it 'リクエストが302になること' do
				expect(response.status).to eq 302
			end
		end
	end
	describe 'GET#index' do
		before do
			login_user user
			get :index
		end
		it 'リクエストが200になること' do
			expect(response.status).to eq 200
		end
		it 'index.htmlを表示すること' do
			expect(response).to render_template :index
		end
	end
	describe 'GET#show' do
		let!(:item) { create(:item) }
		before do
			login_user user
			get :show, params:{ id: 1 }
		end
		it 'リクエストが200になること' do
			expect(response.status).to eq 200
		end
		it 'show.htmlを表示すること' do
			expect(response).to render_template :show
		end
	end
end