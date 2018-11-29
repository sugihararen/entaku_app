class ChangeColumnAddComment < ActiveRecord::Migration[5.2]
  def change
    change_column_comment(:users, :name, 'ユーザー名')
    change_column_comment(:users, :email, 'メールアドレス')
    change_column_comment(:users, :status, 'ユーザーの状態、社員または管理者')
    change_column_comment(:users, :password_digest, 'パスワード')
  end
end
