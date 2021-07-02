class CreateLiquors < ActiveRecord::Migration[5.2]
  def change
    create_table :liquors do |t|
      t.integer :genre_id
      t.string :name
      t.text :detail
      t.string :image_id
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.timestamps
    end
  end
end
