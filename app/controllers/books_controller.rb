class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
    @user = @book.user
    if @book.user == current_user
      render "edit"
    else
      redirect_to books_path
    end
  end
  
  def update
    @book = Book.find(params[:id])
    if  @book.update(book_params)
        flash[:notice] = "You have updated book successfully."
        redirect_to book_path(@book.id)
    else
        render :edit
    end    
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
       if @book.save
        flash[:notice] = "You have created book successfully."
        redirect_to book_path(@book.id)
       else
        @books = Book.all
        @user = current_user
        render :index
       end
  end  
  
  def destroy
      book = Book.find(params[:id])
      book.destroy
      redirect_to books_path, notice: 'your book was succesfully destroyed'  
      
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end
  
end
