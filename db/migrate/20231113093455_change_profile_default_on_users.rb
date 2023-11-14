class ChangeProfileDefaultOnUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :profile, from: nil, to: ''
  end
end
