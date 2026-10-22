class Book < ApplicationRecord
  belongs_to :author

  validates  :title, presence: true
  validates  :isbn, presence: true, uniqueness: true
  validates :available_copies, presence: true, numericality: { greater_than_or_equal_to: 0 }


  validate :published_year_can_not_be_in_the_future
  validate :available_copies_can_not_be_negative





private

  def published_year_can_not_be_in_the_future
 
     if published_year.present? && published_year > Time.now.Year
      errors.add(:published_year,"published year can't be in future")

    end
  end


end
 