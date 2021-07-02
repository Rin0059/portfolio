class AddRateToLiquors < ActiveRecord::Migration[5.2]
  def change
    add_column :liquors, :rate, :float
  end
end
