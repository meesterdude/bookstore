require 'rails_helper'

RSpec.describe "Publishers", type: :request do
  describe "GET /publishers/:id" do
    let(:publisher_1) {Publisher.create(name: 'westinghouse')}
    let(:publisher_)  {Publisher.create(name: 'penguin')}
    let(:shop_1)      {Shop.create(name: 'amazon')}
    let(:shop_2)      {Shop.create(name: 'borders')}
    let(:book_1)      {publisher_1.books.create(title: "1984")}

    it "returns successful response" do
      get publisher_path(publisher_1.id, format: :json)
      json = JSON.parse(response.body)
      expect(response.successful?).to be true
    end

    it "orders shops by books sold" do
      shop_1.shop_books.create(book: book_1, copies_in_stock: 5)
      shop_2.shop_books.create(book: book_1, copies_in_stock: 5)
      shop_2.update(books_sold_count: 5)

      get publisher_path(publisher_1.id, format: :json)
      json = JSON.parse(response.body)
      expect(json["shops"].first["id"]).to eql shop_2.id
    end

    it "does not show shops not selling a publishers book" do
      shop_1.shop_books.create(book: book_1, copies_in_stock: 5)
      shop_2.shop_books.create(book: book_1, copies_in_stock: 5)
      bad_shop = Shop.create(name: 'ye olde books')

      get publisher_path(publisher_1.id, format: :json)
      json = JSON.parse(response.body)
      expect(json["shops"].collect{|shop| shop['id']}).to contain_exactly(shop_1.id, shop_2.id)
    end
  end
end
