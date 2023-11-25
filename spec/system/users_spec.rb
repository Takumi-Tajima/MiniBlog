require 'rails_helper'

RSpec.describe 'Users', type: :system do
  let!(:taro) { FactoryBot.create(:user, name: 'taro') }
  let!(:hanako) { FactoryBot.create(:user, name: 'hanako') }
  let!(:cocoro) { FactoryBot.create(:user, name: 'cocoro') }
  let!(:taro_micropost) { FactoryBot.create(:micropost, user: taro) }

  context 'ユーザーがログインしている場合' do
    before do
      sign_in taro
    end
    it 'headerにMiniBlog、ユーザー一覧、プロフィール、ログアウトのリンクの4つが表示される' do
      visit root_path
      within('.navbar') do
        expect(page).to have_content('MiniBlog')
        expect(page).to have_content('ユーザー一覧')
        expect(page).to have_content('プロフィール')
        expect(page).to have_content('ログアウト')
      end
    end

    it 'ユーザー一覧が閲覧できる' do
      visit users_path
      expect(page).to have_content('ユーザー一覧')
      users = User.all
      users.each do |user|
        expect(page).to have_content(user.name)
      end
      expect(users.sort_by(&:updated_at)).to eq(users)
    end

    it 'ユーザー情報が閲覧できる' do
      visit user_path(hanako)
      expect(page).to have_content('hanako')
      expect(page).to have_content('プロフィール')
      expect(page).to have_content('フォロー')
      expect(page).to have_content('フォロワー')
    end
  end

  context 'ユーザーがログインしていない場合' do
    it 'ユーザー詳細画面にアクセスするとsign in画面にリダイレクトされること' do
      visit user_path(taro)
      expect(page).to have_current_path new_user_session_path
    end

    it 'ユーザー一覧画面にアクセスするとsign in画面にリダイレクトされること' do
      visit users_path
      expect(page).to have_current_path new_user_session_path
    end

    it 'プロフィールにアクセスするとsign in画面にリダイレクトされること' do
      visit user_profile_path
      expect(page).to have_current_path new_user_session_path
    end

    it '投稿の詳細が確認できる' do
      visit micropost_path(taro_micropost)
      expect(page).to have_content(taro_micropost.content)
      expect(page).to have_content(I18n.l(taro_micropost.created_at))
      expect(page).to have_content(I18n.l(taro_micropost.updated_at))
      expect(page).to have_content(taro_micropost.user.name)
    end
  end
end
