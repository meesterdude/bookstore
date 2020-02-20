class CreateShopBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_books do |t|
      t.integer :copies_in_stock
      t.integer :shop_id
      t.integer :book_id

      t.timestamps
    end
  end
end
