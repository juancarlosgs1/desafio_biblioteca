class BooksController < ApplicationController
  def index

   
    @q = Book.ransack(params[:q])
    
    @books = @q.result(distinct: true)

    # @books = Book.all
    # @q = Person.ransack(params[:q])
    # @people = @q.result(distinct: true)
  end

  def create
    # byebug
    @book = Book.create(title: params[:title] , author: params[:author] , genre: params[:genre])
    @book.save
  end

  def show
    # byebug

    @book = Book.find(params[:id].to_i)

    @loans = @book.loans

  end

end
