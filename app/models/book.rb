class Book < ApplicationRecord
  belongs_to :author
  has_many :borrowings
  has_many :members,through: :borrowings
  has_many :reviews,as: :reviewable

  validates  :title, presence: true
  validates  :isbn, presence: true, uniqueness: true
  validates :available_copies, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validate :published_year_can_not_be_in_the_future





private

  def published_year_can_not_be_in_the_future
 
     if published_year.present? && published_year >Time.zone.now.year
      errors.add(:published_year,"published year can't be in future")

    end
  end


end
 