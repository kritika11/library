module BooksHelper
  def check_current_page(path)

    ['sign_in','3000'].map{|n| path.include?(n)}.include?(true) ? false : true
  end

  def get_book_name(booking_id)
     book=Book.find(booking_id)
     book.book_name
  end
end
