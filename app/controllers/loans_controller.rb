class LoansController < ApplicationController
  def new
    @books = Book.all.order(title: :asc)
    @loans = Loan.all.order(id: :desc)
  end

  def create

    @loan = Loan.new

    if params[:state_book].to_i == 0
      @loan.returned = params[:date_loans]
    elsif params[:state_book].to_i == 1
      @loan.borrowed = params[:date_loans]
    end

    @loan.book_id = params[:books].to_i
    
    
    
    if params[:state_book].to_i == 1
      @loan.state_book = "prestamo"
    else
      @loan.state_book = "devolucion"
    end
    

    @loan.user_name = params[:user_name]

    if (@loan.book.state_book == "en_estante" && @loan.state_book == "prestamo") || (@loan.book.state_book == "prestado" && @loan.state_book == "devolucion")
      if @loan.save

        @book = @loan.book

        if @loan.state_book == "prestamo"
          @book.state_book = "prestado"
        else
          @book.state_book = "en_estante"
        end 

        @book.save

        redirect_to new_loan_path , notice: 'Loan was successfully created'
      else
        redirect_to new_loan_path , notice: 'ERROR !!!!!!!'
      end
    else
        redirect_to new_loan_path , notice: 'No es posible realizar este registro'
      
    end


  end
end


