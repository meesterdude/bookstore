class AddPublisherIdToBook < ActiveRecord::Migration[5.2]
  def change
  	add_column :books, :publisher_id, :integer
  end
end
