require 'rails_helper'

RSpec.describe 'フォロー機能', type: :system do
  let!(:taro) { FactoryBot.create(:user, name: 'taro') }
  let!(:hanako) { FactoryBot.create(:user, name: 'hanako') }
  let!(:cocoro) { FactoryBot.create(:user, name: 'cocoro') }

  before do
    sign_in taro
  end

  context '他人のユーザーページのとき' do
    it 'フォローできること' do
      visit user_path(hanako)
      click_on 'フォローする'
      expect(taro.followings.count).to eq(1)
      expect(hanako.followers.count).to eq(1)
    end

    it 'フォロー解除できること' do
      taro.follow(hanako)
      visit user_path(hanako)
      click_on 'フォロー解除'
      expect(taro.followings.count).to eq(0)
      expect(hanako.followers.count).to eq(0)
    end

    it 'フォロー、フォロワー数が表示される' do
      taro.follow(hanako)
      visit user_path(hanako)
      expect(page).to have_content 'フォロー 0'
      expect(page).to have_content 'フォロワー 1'
    end

    it 'フォロー一覧が表示される' do
      taro.follow(hanako)
      taro.follow(cocoro)
      followings_user_path(taro)
      expect(taro.followers.sort_by(&:updated_at)).to eq(hanako.followings)
    end

    it 'フォロワー一覧が表示される' do
      taro.follow(hanako)
      cocoro.follow(hanako)
      followers_user_path(hanako)
      expect(hanako.followers.sort_by(&:updated_at)).to eq(hanako.followers)
    end
  end

  context '自分のユーザーページのとき' do
    it 'フォローボタンが表示されないこと' do
      visit user_path(taro)
      expect(page).to_not have_content('フォローする')
      expect(page).to_not have_content('フォロー解除')
    end
  end
end
