class Book < ActiveRecord::Base
  has_many :issue_details
  validates_presence_of :book_name, :author, :price, :description
  validates_uniqueness_of :book_name

  def self.search(search)
    where('book_name LIKE ?', "%#{search}%")
  end
end
