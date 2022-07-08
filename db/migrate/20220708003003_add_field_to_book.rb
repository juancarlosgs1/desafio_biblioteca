class AddFieldToBook < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :state_book, :integer , default: 0
  end
end
