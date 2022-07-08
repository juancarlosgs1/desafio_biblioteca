class Book < ApplicationRecord
    has_many :loans

    validates :title, presence: true
    validates :author, presence: true
    validates :genre, presence: true

    enum state_book: [:en_estante,:prestado]
end
