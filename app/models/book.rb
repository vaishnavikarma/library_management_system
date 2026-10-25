class Book < ApplicationRecord
  belongs_to :author
  has_many :borrowings
  has_many :members,through: :borrowings
  has_many :reviews,as: :reviewable

  validates  :title, presence: true
  validates  :isbn, presence: true, uniqueness: true
  validates :available_copies, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0 }
  validates :published_year, numericality: {only_integer: true, less_than_or_equal_to: Date.current.year }
  
  
end
