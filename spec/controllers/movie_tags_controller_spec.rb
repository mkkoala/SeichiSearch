require 'rails_helper'
RSpec.describe MovieTagsController,'MovieTagsコントローラーのテスト', type: :controller do

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
	            expect(response.body).to include("映画タグ登録")
	        end
	        it 'タイトルが正しく表示されていること' do
	            expect(response.body).to include("映画タグ一覧")
	        end
	        it 'movie_imageフォームが表示される' do
		  		expect(response.body).to have_field 'movie_tag[movie_image]'
			end
	        it 'titleフォームが表示される' do
		  		expect(response.body).to have_field 'movie_tag[title]'
			end
			it 'bodyフォームが表示される' do
				expect(response.body).to have_field 'movie_tag[body]'
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
end