Rails.application.routes.draw do

  get "publishers/:id", to: 'publishers#show', as: 'publisher'
  post "shops/:shop_id/books/:id/sell", to: 'books#sell', as: 'shop_book_sell'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
