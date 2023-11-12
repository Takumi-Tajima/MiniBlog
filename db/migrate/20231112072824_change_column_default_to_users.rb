class ChangeColumnDefaultToUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :name, from: nil, to: ''
    change_column_default :users, :email, from: nil, to: ''
    change_column_default :users, :encrypted_password, from: nil, to: ''
  end
end
