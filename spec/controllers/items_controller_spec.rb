require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
	let(:user) { create(:user) }
	let(:admin) { create(:admin) }
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
end