require 'rails_helper'
RSpec.describe Mecca, type: :model do

    let(:user) { create(:user) }
    let(:non_favorited_user) { create(:user) }
    let(:mecca) { create(:mecca, user: user) }
    let(:favorite) { create(:favorite, user: user, mecca: mecca) }


    before do
        favorite
    end

    context "データが正しく保存される" do
        it "全て入力してあるので保存される" do
            expect(mecca).to be_valid
        end
    end

    describe '.favorited_by?' do
        context 'ユーザーによって、お気に入りされている場合' do
            it 'true を返す' do
                expect(mecca.favorited_by?(user)).to be true
            end
        end
        context 'ユーザーによって、お気に入りされていない場合' do
            it 'false を返す' do
                expect(mecca.favorited_by?(non_favorited_user)).to be false
            end
        end
    end
end