require 'rails_helper'

RSpec.describe 'Users', type: :system do
  let(:user) { FactoryBot.create(:user) }

  context 'ユーザーがログインしている場合' do
    it 'headerにMiniBlog、ユーザー一覧、プロフィール、ログアウトのリンクの4つが表示される' do
      sign_in user
      visit root_path
      expect(page).to have_selector('nav.navbar a', count: 4)
    end
  end
end
