class BooksController < ApplicationController
  before_action :set_shop
  before_action :set_book
  before_action :set_shop_book

  def sell
    if count <= @shop_book.copies_in_stock
      @shop.increment!(:books_sold_count, count)
      @shop_book.decrement!(:copies_in_stock, count)
      head :accepted
    else
      head :unprocessable_entity 
    end
  end

  private
    
  def set_shop
    @shop = Shop.find(params[:shop_id])
  end

  def set_book
    @book = @shop.books.find(params[:id])
  end

  def set_shop_book
    @shop_book = @shop.shop_books.where(book: @book).first
  end

  def count
    params[:count].to_i
  end

end
