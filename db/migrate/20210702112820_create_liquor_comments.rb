class CreateLiquorComments < ActiveRecord::Migration[5.2]
  def change
    create_table :liquor_comments do |t|
      t.integer :user_id
      t.integer :liquor_id
      t.text :comment
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.timestamps
    end
  end
end
