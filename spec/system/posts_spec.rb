require 'rails_helper'

RSpec.describe '投稿機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:other_user) { FactoryBot.create(:user) }
  let!(:micropost) { FactoryBot.create(:micropost, user: user) }
  let!(:other_micropost) { FactoryBot.create(:micropost, user: other_user) }
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

  it '投稿時に何も入力しないとエラーが発生する' do
    visit new_user_micropost_path
    fill_in 'Content', with: ''
    click_on 'Create Micropost'
    expect(page).to have_content 'Content は必須項目です。'
  end

  context '自分の投稿のとき' do
    it '編集できること' do
      visit micropost_path(micropost)
      click_on 'Edit'
      fill_in 'Content', with: '編集したよ'
      click_on 'Update Micropost'
      expect(page).to have_content '編集したよ'
    end

    it '削除できること' do
      micropost_count_before = Micropost.count
      visit micropost_path(micropost)
      expect(page).to have_content 'Destroy'
      click_on 'Destroy'
      expect(page).to have_content '投稿を削除しました。'
      expect(Micropost.count).to eq(micropost_count_before - 1)
      expect(Micropost.where(id: micropost.id)).to be_empty
    end
  end

  context '他人の投稿のとき' do
    it '編集できないこと' do
      visit micropost_path(other_micropost)
      expect(page).to_not have_content('Edit')
    end

    it '削除できないこと' do
      visit micropost_path(other_micropost)
      expect(page).to_not have_content('Destroy')
    end
  end
end
