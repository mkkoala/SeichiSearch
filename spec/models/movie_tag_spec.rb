require 'rails_helper'

RSpec.describe 'MovieTagモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    let(:user) { create(:user) }
    let!(:movie_tag) { build(:movie_tag, user_id: user.id) }

    context 'titleカラム' do
      it '空欄でないこと' do
        movie_tag.title = ''
        expect(movie_tag.valid?).to eq false;
      end
    end
    context 'bodyカラム' do
      it '空欄でないこと' do
        movie_tag.body = ''
        expect(movie_tag.valid?).to eq false;
      end
    end
    context 'movie_imageカラム' do
      it '空欄でないこと' do
          movie_tag.movie_image_id = ''
          expect(movie_tag.valid?).to eq false;
      end
    end
    context "データが正しく保存される" do
      it "全て入力してあるので保存される" do
        expect(movie_tag).to be_valid
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(MovieTag.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'MeccasMovieTagモデルとの関係' do
      it '1:Nとなっている' do
        expect(MovieTag.reflect_on_association(:meccas_movie_tags).macro).to eq :has_many
      end
    end
  end
end