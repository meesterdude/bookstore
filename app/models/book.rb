# == Schema Information
#
# Table name: books
#
#  id           :bigint           not null, primary key
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  publisher_id :integer
#

class Book < ApplicationRecord
	belongs_to :publisher
	has_many :shop_books
	has_many :shops, through: :shop_books
end
