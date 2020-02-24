require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  # 名前が空欄で登録できない→名前を空欄で登録したらfalse
  # バリデーションしていない状態で失敗→設定したら成功
  # 登録できるかできないか 登録できたら失敗
  # エラーメッセージがなければ失敗

  describe 'バリデーションのテスト' do
    let(:user) { build(:user) }
    subject { test_user.valid? }
    context 'nameカラム' do
      let(:test_user) { user }
      it '空欄でないこと' do
        test_user.name = ''
        is_expected.to eq false;
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'Meccaモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:meccas).macro).to eq :has_many
      end
    end
    context 'MovieTagモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:movie_tags).macro).to eq :has_many
      end
    end
    context 'MeccaCommentモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:mecca_comments).macro).to eq :has_many
      end
    end
    context 'Favoriteモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end
  end
end
# アソシエーションのテスト