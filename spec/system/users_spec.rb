require 'rails_helper'

RSpec.describe "Users", type: :system do
  let(:user) { FactoryBot.create(:user) }

  context 'ユーザー登録ができるとき' do
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      # ユーザーがサイトに訪れる
      # visit root_path
      expect(user.name).to eq 'aaa'
      # ヘッダーに表示されているログインボタンを押す
      # 登録をしていないのでsing_upをクリック
      # ユーザー情報を打ち込む
      # 入力が完了してsing_upボタンを押す
      # Userモデルのカウント数が1上がる
      # 投稿の一覧画面（root_path）へリダイレクトされる
      # headerには、ログアウト、ユーザー一覧、プロフィールの3つが表示されている
      # ログインボタンは表示されてない
    end
  end

  pending "add some scenarios (or delete) #{__FILE__}"
end
