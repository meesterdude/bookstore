# == Schema Information
#
# Table name: shop_books
#
#  id              :bigint           not null, primary key
#  copies_in_stock :integer
#  shop_id         :integer
#  book_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class ShopBook < ApplicationRecord
	belongs_to :shop
	belongs_to :book
end
