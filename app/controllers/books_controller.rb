class BooksController < ApplicationController
  
  def new
    
  end
 
  def create
   @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
      flash[:notice] = "Book was successfully created."
    else
      @books = Book.all
      render :index
    end
  end
  
  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
   if @book.update(book_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to book_path(@book.id)
   else
    render:edit
   end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
    flash[:notice] = "Book was successfully destroyed."
  end  
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
