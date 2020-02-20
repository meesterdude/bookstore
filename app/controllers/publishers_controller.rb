class PublishersController < ApplicationController
  before_action :set_publisher, only: [:show]

  # GET /publishers/1.json
  def show
    @shops = @publisher.shop_books.map(&:shop).sort_by(&:books_sold_count).reverse
  end


  private

  def set_publisher
    @publisher = Publisher.find(params[:id])
  end
end
