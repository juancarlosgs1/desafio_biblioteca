class LoansController < ApplicationController
  def new
    @books = Book.all.order(title: :asc)
  end

  def create
    
  end
end
