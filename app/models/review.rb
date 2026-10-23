class Review < ApplicationRecord
  belongs_to :member
  belongs_to :reviewable, polymorphic: true

  validates :rating, numericality:{greater_than_or_equal_to:1,less_than_or_equal_to:5}
end
