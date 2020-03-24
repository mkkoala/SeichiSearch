require 'rails_helper'

RSpec.describe 'Meccaモデルのテスト', type: :model do
  let(:user) { create(:user) }
  let(:non_favorited_user) { create(:user) }
  let!(:mecca) { build(:mecca, user_id: user.id) }
  let(:favorite) { create(:favorite, user: user, mecca: mecca) }
  describe 'バリデーションのテスト' do
    context 'nameカラム' do
      it '空欄でないこと' do
        mecca.name = ''
        expect(mecca.valid?).to eq false;
      end
    end
    context 'bodyカラム' do
      it '空欄でないこと' do
        mecca.body = ''
        expect(mecca.valid?).to eq false;
      end
    end
    context 'mecca_imageカラム' do
      it '空欄でないこと' do
        mecca.mecca_image_id = ''
        expect(mecca.valid?).to eq false;
      end
    end
    context 'addressカラム' do
      it '空欄でないこと' do
        mecca.address = ''
        expect(mecca.valid?).to eq false;
      end
    end
    context 'post_codeカラム' do
      it '空欄でないこと' do
        mecca.post_code = ''
        expect(mecca.valid?).to eq false;
      end
      it '7桁であること' do
        mecca.post_code = '11111111'
        expect(mecca.valid?).to eq false;
      end
    end
    context "データが正しく保存される" do
      it "全て入力してあるので保存される" do
        expect(mecca).to be_valid
      end
    end
  end

  describe 'いいね機能のテスト' do
    before do
      favorite
    end
    context 'ユーザーによって、いいねされている場合' do
      it 'true を返す' do
        expect(mecca.favorited_by?(user)).to be true
      end
    end
    context 'ユーザーによって、いいねされていない場合' do
      it 'false を返す' do
        expect(mecca.favorited_by?(non_favorited_user)).to be false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Mecca.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'MeccasMovieTagモデルとの関係' do
      it '1:Nとなっている' do
        expect(Mecca.reflect_on_association(:meccas_movie_tags).macro).to eq :has_many
      end
    end
    context 'Tagモデルとの関係' do
      it '1:Nとなっている' do
        expect(Mecca.reflect_on_association(:tags).macro).to eq :has_many
      end
    end
    context 'MeccaCommentモデルとの関係' do
      it '1:Nとなっている' do
        expect(Mecca.reflect_on_association(:mecca_comments).macro).to eq :has_many
      end
    end
    context 'Favoriteモデルとの関係' do
      it '1:Nとなっている' do
        expect(Mecca.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end
  end
end