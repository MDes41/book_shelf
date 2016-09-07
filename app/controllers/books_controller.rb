class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def show
      @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      session[:most_recent_book_id] = @book.id
      flash[:notice] = "Books created whoo"
      redirect_to books_path
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id] )
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes( book_params )
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    session[:most_recent_book_id] = Book.last.id
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :price, :quantity)
  end
end
