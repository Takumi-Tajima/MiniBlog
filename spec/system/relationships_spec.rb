require 'rails_helper'

RSpec.describe "フォロー機能", type: :system do
  let(:user) { FactoryBot.create(:user)}

  before do
  end

  xit '新規投稿ができる' do
  end

  context '他人のユーザーページのとき' do
    xit 'フォローできること' do
    end

    xit 'フォロー解除できること' do
    end
  end

  context '自分のユーザーページのとき' do
    xit 'フォローボタンが表示されないこと' do
    end
  end
end
