# == Schema Information
#
# Table name: publishers
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Publisher < ApplicationRecord
	has_many :books
	has_many :shop_books, through: :books
	has_many :shops, -> { order(books_sold_count: :desc) }, through: :shop_books
end
