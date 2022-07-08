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

    if @loan.save
      redirect_to new_loan_path , notice: 'Loan was successfully created'
    else
      redirect_to new_loan_path , notice: 'ERROR !!!!!!!'
    end

      # @loan = Loan.create(book_id: params[:books].to_i , state_book: params[:state_book],  )

  end
end



# · lo que viene del formulario

# Parameters: {"utf8"=>"✓", "authenticity_token"=>"eqfM5MGA19IMb39bYJtSnN67fyJltugD9gohmK2hgnwGPxPkHXZj4+mx7735WaAYD/cdUXfk6/dcyL65ZcogPw==", "books"=>"54", "state_book"=>"1", "date_loans"=>"2022-07-07T18:52", "user_name"=>"Juan", "commit"=>"Guardar"}

# [:devolucion , :prestamo]

# t.datetime "borrowed"
# t.datetime "returned"