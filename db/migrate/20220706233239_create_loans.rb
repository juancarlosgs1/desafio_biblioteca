class CreateLoans < ActiveRecord::Migration[5.2]
  def change
    create_table :loans do |t|
      t.references :book, foreign_key: true
      t.integer :state_book, default: 0
      t.datetime :borrowed
      t.datetime :returned
      t.string :user_name
      t.timestamps
    end
  end
end
