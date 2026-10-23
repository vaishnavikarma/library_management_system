class Borrowing < ApplicationRecord
  belongs_to :member
  belongs_to :book

  validates :due_date, comparison:{greater_than: :borrow_date}


  private
  def book_availability
    if book.available_copies.present? && book.available_copies <= 0
      errors.add(:available_copies,"books are not available")
    end
  end
  
end
