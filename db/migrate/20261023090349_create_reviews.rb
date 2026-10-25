class CreateReviews < ActiveRecord::Migration[8.1]
  def change
    create_table :reviews do |t|
      t.references :member, null: false, foreign_key: true
      t.references :reviewable, polymorphic: true, null: false
      t.text :text
      t.integer :rating

      t.timestamps
    end
  end
end
# Reviews

Review.find_or_create_by!(
  member: Member.find_by!(email: "rahul@gmail.com"),
  reviewable: Book.find_by!(isbn: "ISBN005")
) do |review|
  review.rating = 5
  review.text = "A very interesting book."
end

Review.find_or_create_by!(
  member: Member.find_by!(email: "priya@gmail.com"),
  reviewable: Book.find_by!(isbn: "ISBN466")
) do |review|
  review.rating = 4
  review.text = "An inspiring book."
end

Review.find_or_create_by!(
  member: Member.find_by!(email: "amit@gmail.com"),
  reviewable: Book.find_by!(isbn: "ISBN288")
) do |review|
  review.rating = 5
  review.text = "Very informative and motivating."
end

Review.find_or_create_by!(
  member: Member.find_by!(email: "neha@gmail.com"),
  reviewable: Author.find_by!(email: "rk@gmail.com")
) do |review|
  review.rating = 4
  review.text = "A wonderful storyteller."
end

Review.find_or_create_by!(
  member: Member.find_by!(email: "suresh@gmail.com"),
  reviewable: Author.find_by!(email: "apj@gmail.com")
) do |review|
  review.rating = 5
  review.text = "An inspiring writer."
end