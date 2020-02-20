class SetShopBookCopiesInStockToDefaultZero < ActiveRecord::Migration[5.2]
  def change
  	change_column :shop_books, :copies_in_stock, :integer, default: 0
  end
end
