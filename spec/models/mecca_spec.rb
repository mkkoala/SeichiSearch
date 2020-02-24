require 'rails_helper'

RSpec.describe Mecca, "モデルに関するテスト", type: :model do

    let(:user) { create(:user) }
    let(:non_favorited_user) { create(:user) }
    let(:mecca) { create(:mecca, user: user) }
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
    end




    before do
        favorite
    end

        context "データが正しく保存される" do
            it "全て入力してあるので保存される" do
                expect(mecca).to be_valid
            end
        end

    describe '.favorited_by? いいね機能のテスト' do
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
    end
end