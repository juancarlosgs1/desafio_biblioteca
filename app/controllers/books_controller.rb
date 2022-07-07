class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def create
    # byebug
    @book = Book.create(title: params[:title] , author: params[:author] , genre: params[:genre])
    @book.save
  end
end
