class BooksController < ApplicationController
  def index
    books = Book.all
    render json: books.as_json
  end 
  def show
    book = Book.find_by(id: params[:id])
    render json: book.as_json
  end
  def create
    book = Book.new(
      id: params[:input_id],
      name: params[:input_name],
      author: params[:input_author],
      price: params[:input_price],
      isbn: params[:input_isbn]
    )
    book.save
    render json: book.as_json
  end
  def update
    book = Book.find_by(id: params[:id])
    book.name = params[:name]
    book.author = params[:author]
    book.price = params[:price]
    book.isbn = params[:isbn]
    book.save
    render json: book.as_json
  end
  def destroy
    book = Book.find_by(id: params[:id])
    book.destroy
    render json: book.as_json
  end
end
