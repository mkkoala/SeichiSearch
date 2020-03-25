require 'rails_helper'
RSpec.describe MeccasController,'Meccasコントローラーのテスト', type: :controller do

	let(:user) { create(:user) }

    describe '聖地新規投稿ページ' do
	    context "ログイン済みなのでページが正しく表示される" do
	        before do
	        	sign_in user
	        	get :new
	        end
	        it 'リクエストは200 OKとなること' do
	        	expect(response.status).to eq 200
	        end
	        render_views
	        it 'タイトルが正しく表示されていること' do
	            expect(response.body).to include("新規投稿")
	        end
	        it 'nameフォームが表示される' do
		  		expect(response.body).to have_field 'mecca[name]'
			end
			it 'bodyフォームが表示される' do
				expect(response.body).to have_field 'mecca[body]'
			end
			it '新規投稿ボタンが表示される' do
				expect(response.body).to have_button '新規投稿'
			end
	    end

	    context "未ログイン状態であれば、リダイレクトする" do
	        before do
	        	get :new
	        end
	        it 'リクエストは302 OKとなること' do
	        	expect(response.status).to eq 302
	        end
	    end
	end

	describe '聖地一覧ページ' do
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
	            expect(response.body).to include("聖地一覧")
	        end
	        it '映画タグサイドバーが正しく表示されていること' do
	            expect(response.body).to include("映画タグ検索")
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