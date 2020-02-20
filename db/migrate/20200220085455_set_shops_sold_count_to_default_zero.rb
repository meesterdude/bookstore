class SetShopsSoldCountToDefaultZero < ActiveRecord::Migration[5.2]
  def change
  	change_column :shops, :books_sold_count, :integer, default: 0
  end
end
