class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  # GET /books.json
  def index
    @books = Book.where(available:true)
    @issue_details = IssueDetail.all.where(returningDate:nil)

    if params[:search]
      @books = Book.search(params[:search])
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show

  end

  # GET /books/new
  def new
    @book = Book.new

  end
end
