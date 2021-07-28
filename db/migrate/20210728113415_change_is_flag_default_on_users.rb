class ChangeIsFlagDefaultOnUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :user_status, from: false, to: true
  end
end
