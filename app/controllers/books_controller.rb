class BooksController < ApplicationController
  def index
    @q = Book.ransack(params[:q])
    
    @books = @q.result(distinct: true)

  end

  def create
    @book = Book.create(title: params[:title] , author: params[:author] , genre: params[:genre])
    @book.save
  end

  def show

    @book = Book.find(params[:id].to_i)

    @loans = @book.loans

  end

end
