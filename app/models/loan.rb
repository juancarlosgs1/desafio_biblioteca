class Loan < ApplicationRecord
  belongs_to :book
  enum state_book: [:en_estante , :prestado]
end
