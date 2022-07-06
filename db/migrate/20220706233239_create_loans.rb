class CreateLoans < ActiveRecord::Migration[5.2]
  def change
    create_table :loans do |t|
      t.references :book, foreign_key: true
      t.integer :state_book
      t.datetime :borrowed
      t.datetime :returned

      t.timestamps
    end
  end
end
