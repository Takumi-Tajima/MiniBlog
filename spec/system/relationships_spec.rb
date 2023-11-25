require 'rails_helper'

RSpec.describe 'フォロー機能', type: :system do
  let!(:taro) { FactoryBot.create(:user, name: 'taro') }
  let!(:hanako) { FactoryBot.create(:user, name: 'hanako') }

  before do
    sign_in taro
  end

  context '他人のユーザーページのとき' do
    it 'フォローできること' do
      visit user_path(hanako)
      expect {
        click_on 'フォローする'
      }.to change(taro.followings, :count).by(1)
    end

    xit 'フォロー解除できること' do
    end
  end

  context '自分のユーザーページのとき' do
    xit 'フォローボタンが表示されないこと' do
    end
  end
end
