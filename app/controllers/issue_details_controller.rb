class IssueDetailsController < ApplicationController
before_action :set_issue ,:only => [:show,:update]
  def index
    @issue = IssueDetail.all
  end

  def show
    @book_id=params[:book_id]

  end

  def new

   @issue=IssueDetail.new
   @book_id=params[:book_id]
   respond_to do |format|
     format.js
     format.html
   end

  end

  def update
    debugger
    respond_to do |format|
      if @issue.update(issue_params)
        book = Book.find(params[:issue_detail][:book_id])
        book.available = true
        book.save
        format.html { redirect_to books_path, notice: 'Book returned !!!.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def create

    @issue = IssueDetail.new(issue_params)
    respond_to do |format|
      if @issue.save
        book = Book.find(params[:issue_detail][:book_id])
        book.available = false
        book.save
        debugger
        format.html { redirect_to books_path, notice: 'Book is issued!!!!!!!' }
        format.json { render :show, status: :created, location: @book }

      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def set_issue
    @issue=IssueDetail.find(params[:id])
  end

  def issue_params
    params.require(:issue_detail).permit(:book_id, :issueDate, :returnDate, :returningDate)
  end
end