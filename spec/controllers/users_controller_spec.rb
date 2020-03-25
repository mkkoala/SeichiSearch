require 'rails_helper'
RSpec.describe UsersController,'Usersコントローラーのテスト', type: :controller do

	let(:user) { create(:user) }

	describe '映画タグ登録・一覧ページ' do
	    context "ログイン済みなのでページが正しく表示される" do
	        before do
	        	sign_in user
	        	get :index
	        end
	        it 'リクエストは200 OKとなること' do
	        	expect(response.status).to eq 200
	        end
	        render_views
	        it 'タイトルが正しく表示されていること' do
	            expect(response.body).to include("会員一覧")
	        end
	    end

	    context "未ログイン状態であれば、リダイレクトする" do
	        before do
	        	get :index
	        end
	        it 'リクエストは302 OKとなること' do
	        	expect(response.status).to eq 302
	        end
	    end
	end

# describe 'ユーザー認証のテスト', type: :controller do
#   describe 'ユーザー新規登録' do
#     before do
#       visit new_user_registration_path
#     end
#     context '新規登録画面に遷移' do
#       it '新規登録に成功する' do
#         fill_in 'user[name]', with: Faker::Internet.username(specifier: 5)
#         fill_in 'user[email]', with: Faker::Internet.email
#         fill_in 'user[password]', with: 'password'
#         fill_in 'user[password_confirmation]', with: 'password'
#         click_button 'Sign up'

#         expect(page).to have_content 'successfully'
#       end
#       it '新規登録に失敗する' do
#         fill_in 'user[name]', with: ''
#         fill_in 'user[email]', with: ''
#         fill_in 'user[password]', with: ''
#         fill_in 'user[password_confirmation]', with: ''
#         click_button 'Sign up'

#         expect(page).to have_content 'error'
#       end
#     end
#   end
#   describe 'ユーザーログイン' do
#     let(:user) { create(:user) }
#     before do
#       visit new_user_session_path
#     end
#     context 'ログイン画面に遷移' do
#       let(:test_user) { user }
#       it 'ログインに成功する' do
#         fill_in 'user[name]', with: test_user.name
#         fill_in 'user[password]', with: test_user.password
#         click_button 'Log in'

#         expect(page).to have_content 'successfully'
#       end

#       it 'ログインに失敗する' do
#         fill_in 'user[name]', with: ''
#         fill_in 'user[password]', with: ''
#         click_button 'Log in'

#         expect(current_path).to eq(new_user_session_path)
#       end
#     end
#   end
# end

end
