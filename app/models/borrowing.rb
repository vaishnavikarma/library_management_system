class Borrowing < ApplicationRecord
  belongs_to :member
  belongs_to :book

  validates :due_date, comparison:{greater_than: :borrow_date}
  validate :book_availability
  validate :member_has_borrowing_capacity, on: :create
  validates :borrow_date, :due_date, presence: true

  private
  def book_availability
   return if book.nil?
   if book.available_copies.nil? || book.available_copies <= 0
      errors.add(:base, "Books are not available")
    end
  end
  def member_has_borrowing_capacity
    if member.borrowing_limit<=member.borrowings.where(return_date: nil).count
      errors.add(:base,"Member has reached the maximum borrowing limit")
    end
  end
end



