require 'rails_helper'

RSpec.describe "Books", type: :request do
  describe "POST /shops/:shop_id/books/:id/sell" do
    let(:publisher_1) {Publisher.create(name: 'westinghouse')}
    let(:publisher_)  {Publisher.create(name: 'penguin')}
    let(:shop_1)      {Shop.create(name: 'amazon')}
    let(:shop_2)      {Shop.create(name: 'borders')}
    let(:book_1)      {publisher_1.books.create(title: "1984")}
    let(:book_2)      {publisher_1.books.create(title: "Dictionary")}

    before {shop_1.shop_books.create(book: book_1, copies_in_stock: 5)}
    context "success" do
      it "returns successful response" do
        post shop_book_sell_path(shop_1, book_1, params: {count: 1})
        expect(response).to have_http_status(202)
      end
      it "decrements copies_in_stock for shop_book" do
        post shop_book_sell_path(shop_1, book_1, params: {count: 1})
        expect(shop_1.shop_books.first.copies_in_stock).to eql 4
      end
      it "increments books_sold_count" do
        post shop_book_sell_path(shop_1, book_1, params: {count: 1})
        expect(shop_1.reload.books_sold_count).to eql 1
      end
   end

   context "failure" do
    it "fails if count exceeds available stock" do
      post shop_book_sell_path(shop_1, book_1, params: {count: 6})
      expect(response.successful?).to eql false
      expect(shop_1.reload.books_sold_count).to eql 0
    end

    it "fails if book not in shop" do
      expect {post shop_book_sell_path(shop_1, book_2, params: {count: 1}) }.to raise_error(ActiveRecord::RecordNotFound)
    end
    
   end
  end
end
