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
      visit followings_user_path(taro)
      expect(taro.followings.sort_by(&:updated_at)).to eq(taro.followings)
      expect(page).to have_link 'hanako', href: user_path(hanako)
      expect(page).to have_link 'cocoro', href: user_path(cocoro)
    end

    it 'フォロワー一覧が表示される' do
      taro.follow(hanako)
      cocoro.follow(hanako)
      visit followers_user_path(hanako)
      expect(hanako.followers.sort_by(&:updated_at)).to eq(hanako.followers)
      expect(page).to have_link 'taro', href: user_path(taro)
      expect(page).to have_link 'cocoro', href: user_path(cocoro)
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
