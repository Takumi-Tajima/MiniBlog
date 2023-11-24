require 'rails_helper'

RSpec.describe 'Users', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:other_user) { FactoryBot.create(:user) }
  let!(:micropost) { FactoryBot.create(:micropost, user: user) }

  context 'ユーザーがログインしている場合' do
    before do
      sign_in user
    end
    it 'headerにMiniBlog、ユーザー一覧、プロフィール、ログアウトのリンクの4つが表示される' do
      visit root_path
      expect(page).to have_content('MiniBlog')
      expect(page).to have_content('ユーザー一覧')
      expect(page).to have_content('プロフィール')
      expect(page).to have_content('ログアウト')
    end

    it 'ユーザー一覧が閲覧できる' do
      visit users_path
      expect(page).to have_content('ユーザー一覧')
    end

    it 'ユーザー情報が閲覧できる' do
      visit user_path(other_user)
      expect(page).to have_content('名前')
      expect(page).to have_content('プロフィール')
      expect(page).to have_content('フォロー')
      expect(page).to have_content('フォロワー')
    end
  end

  context 'ユーザーがログインしていない場合' do
    it 'ユーザー詳細画面にアクセスするとsign in画面にリダイレクトされること' do
      visit user_path(user)
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
      visit micropost_path(micropost)
      expect(page).to have_content('内容')
      expect(page).to have_content('投稿日時')
      expect(page).to have_content('更新日時')
      expect(page).to have_content('投稿者')
    end
  end
end
