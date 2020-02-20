# == Schema Information
#
# Table name: shops
#
#  id               :bigint           not null, primary key
#  name             :string
#  books_sold_count :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Shop < ApplicationRecord
	has_many :shop_books
	has_many :books, through: :shop_books
end
