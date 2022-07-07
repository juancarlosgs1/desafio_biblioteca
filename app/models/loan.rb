class Loan < ApplicationRecord
  belongs_to :book

  validates :state_book , presence: true
  validates :user_name, presence: true

  enum state_book: [:devolucion , :prestamo]
end
