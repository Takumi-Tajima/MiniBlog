require 'rails_helper'

RSpec.describe '投稿機能', type: :system do
  let(:user) { FactoryBot.create(:user) }
  before do
    sign_in user
  end

  it '新規投稿ができる' do
    visit new_user_micropost_path
    fill_in 'Content', with: 'hogehogehoge'
    click_on 'Create Micropost'
    expect(page).to have_content '新規投稿を作成しました。'
    expect(page).to have_content 'hogehogehoge'
  end

  context '自分の投稿のとき' do
    it '編集できること' do
      visit new_user_micropost_path
      fill_in 'Content', with: 'hogehogehoge'
      click_on 'Create Micropost'
    end

    xit '削除できること' do
    end
  end

  context '他人の投稿のとき' do
    xit '編集できないこと' do
    end

    xit '削除できないこと' do
    end
  end
end
