class AddUserIdToLiquors < ActiveRecord::Migration[5.2]
  def change
    add_column :liquors, :user_id, :integer
  end
end
