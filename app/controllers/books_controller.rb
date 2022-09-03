class BooksController < ApplicationController
  before_action :book_select, :section_select

  def new
    @book = Book.new(section_id: book_params[:section_id])
  end

  def create
    book = Book.create!(book_create_params)
    redirect_to "/sections/#{book_create_params[:section_id]}/books/#{book.id}"
  end

  def update
    @book.update(book_create_params)
    redirect_to section_book_path @book
  end

  def destroy
    @book.destroy
    redirect_to section_path @book.section_id
  end

  private

  def book_select
    @book = Book.find_by(id: book_params[:id])
  end

  def section_select
    @section = Section.find_by(id: book_params[:section_id])
  end
  
  def book_params
    params.permit(:section_id, :id)
  end

  def book_create_params
    params.require(:book).permit(:name, :description, :section_id)
  end
end
