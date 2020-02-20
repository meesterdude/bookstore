json.shops @shops do |shop|
	json.id shop.id
	json.name shop.name
	json.books_sold_count shop.books_sold_count
	json.books_in_stock shop.shop_books.joins(:book).where("books.publisher_id = ?", @publisher.id) do |shop_book|
		json.id shop_book.id
		json.title shop_book.book.title
		json.copies_in_stock shop_book.copies_in_stock
		json.sell_path shop_book_sell_path(shop, shop_book.book)
	end
end