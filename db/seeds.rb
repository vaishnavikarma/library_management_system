# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

#Authors 
Author.find_or_create_by!(email:"rk@gmail.com") do |author|
    author.name = "R.K.Narayan"
    author.bio = "Indian author"
end
Author.find_or_create_by!(email:"apj@gmail.com") do |author|
    author.name = "A.P.J Kalam"
    author.bio ="Indian aerospace scientist"
end
Author.find_or_create_by!(email:"ruskin@gmail.com") do |author|
    author.name ="Ruskin Bond"
    author.bio = "A writer"
end
#Books
Book.find_or_create_by!(isbn:"ISBN005") do |book|
    book.title = "swami and friends"
    book.published_year = 1935
    book.available_copies = 5
    book.author_id = 1
end
Book.find_or_create_by!(isbn:"ISBN012") do |book|
    book.title = "The Bachelor of Arts"
    book.published_year = 1937
    book.available_copies = 10
    book.author_id = 1
end
Book.find_or_create_by!(isbn:"ISBN648") do |book|
    book.title = "The Guide"
    book.published_year = 1958
    book.available_copies = 9
    book.author_id = 1
end
Book.find_or_create_by!(isbn:"ISBN466") do |book|
    book.title = "Wings of Fire"
    book.published_year = 1999
    book.available_copies = 8
    book.author_id = 2
end
Book.find_or_create_by!(isbn:"ISBN288") do |book|
    book.title = "Ignited Minds"
    book.published_year = 2002
    book.available_copies = 11
    book.author_id = 2
end
Book.find_or_create_by!(isbn:"ISBN749") do |book|
    book.title = "Guiding Souls"
    book.published_year = 2005
    book.available_copies = 7
    book.author_id = 2
end
Book.find_or_create_by!(isbn:"ISBN781") do |book|
    book.title = "The Luminous Sparks"
    book.published_year = 2004
    book.available_copies = 12
    book.author_id = 2
end
Book.find_or_create_by!(isbn:"ISBN388") do |book|
    book.title = "The Room on the Roof"
    book.published_year = 1956
    book.available_copies = 10
    book.author_id = 3
end
Book.find_or_create_by!(isbn:"ISBN443") do |book|
    book.title = "The Blue Umbrella"
    book.published_year = 1980
    book.available_copies = 6
    book.author_id = 3
end
Book.find_or_create_by!(isbn:"ISBN274") do |book|
    book.title = "A Flight of Pigeons"
    book.published_year = 1978
    book.available_copies = 12
    book.author_id = 3
end
Book.find_or_create_by!(isbn:"ISBN350") do |book|
    book.title = "The English Teacher"
    book.published_year = 2016
    book.available_copies = 13
    book.author_id = 1
end
Book.find_or_create_by!(isbn:"ISBN434") do |book|
    book.title = "Turning Points"
    book.published_year = 2017
    book.available_copies = 10
    book.author_id = 2
end
Book.find_or_create_by!(isbn:"ISBN920") do |book|
    book.title = "The Hidden Pool"
    book.published_year = 2018
    book.available_copies = 11
    book.author_id = 3
end
Book.find_or_create_by!(isbn:"ISBN929") do |book|
    book.title = "Great Stories for Children"
    book.published_year = 2020
    book.available_copies = 10
    book.author_id = 3
end

Member.find_or_create_by!(email:"rahul@gmail.com") do |member|
    member.name = "Rahul"
    member.type = "Student"
end
Member.find_or_create_by!(email:"priya@gmail.com") do |member|
member.name = "Priya"
member.type = "Student"
end
Member.find_or_create_by!(email:"amit@gmail.com") do |member|
    member.name = "Amit"
    member.type = "Student"
end
Member.find_or_create_by!(email:"neha@gmail.com") do |member|
    member.name = "Neha"
    member.type = "Faculty"
end
Member.find_or_create_by!(email:"suresh@gmail.com") do |member|
    member.name = "Suresh"
    member.type = "Faculty"
end

rahul = Member.find_by!(email:"rahul@gmail.com")
priya = Member.find_by!(email:"priya@gmail.com")
priya.update!(refered_by_id:rahul.id)
amit = Member.find_by!(email: "amit@gmail.com")
neha = Member.find_by!(email: "neha@gmail.com")
amit.update!(refered_by_id:priya.id)
neha.update!(refered_by_id:priya.id)
suresh = Member.find_by!(email: "suresh@gmail.com")
# Borrowings

Borrowing.find_or_create_by!(
  member: rahul,
  book: Book.find_by!(isbn: "ISBN005"),
  borrow_date: 20.days.ago.to_date
) do |borrowing|
  borrowing.due_date = 10.days.ago.to_date
  borrowing.return_date = 5.days.ago.to_date
end

Borrowing.find_or_create_by!(
  member: priya,
  book: Book.find_by!(isbn: "ISBN466"),
  borrow_date: 15.days.ago.to_date
) do |borrowing|
  borrowing.due_date = 7.days.ago.to_date
  borrowing.return_date = nil
end

Borrowing.find_or_create_by!(
  member: amit,
  book: Book.find_by!(isbn: "ISBN012"),
  borrow_date: 12.days.ago.to_date
) do |borrowing|
  borrowing.due_date = 5.days.ago.to_date
  borrowing.return_date = nil
end

Borrowing.find_or_create_by!(
  member: neha,
  book: Book.find_by!(isbn: "ISBN648"),
  borrow_date: 10.days.ago.to_date
) do |borrowing|
  borrowing.due_date = 5.days.from_now.to_date
  borrowing.return_date = nil
end

Borrowing.find_or_create_by!(
  member: suresh,
  book: Book.find_by!(isbn: "ISBN288"),
  borrow_date: 30.days.ago.to_date
) do |borrowing|
  borrowing.due_date = 20.days.ago.to_date
  borrowing.return_date = 18.days.ago.to_date
end

Borrowing.find_or_create_by!(
  member: rahul,
  book: Book.find_by!(isbn: "ISBN749"),
  borrow_date: 8.days.ago.to_date
) do |borrowing|
  borrowing.due_date = 2.days.ago.to_date
  borrowing.return_date = nil
end
Borrowing.find_or_create_by!(
  member: suresh,
  book: Book.find_by!(isbn: "ISBN443"),
  borrow_date: 4.days.ago.to_date
) do |borrowing|
  borrowing.due_date = 10.days.from_now.to_date
  borrowing.return_date = nil
end

Borrowing.find_or_create_by!(
  member: priya,
  book: Book.find_by!(isbn: "ISBN274"),
  borrow_date: 25.days.ago.to_date
) do |borrowing|
  borrowing.due_date = 15.days.ago.to_date
  borrowing.return_date = 12.days.ago.to_date
end

# Reviews

Review.find_or_create_by!(
  member: Member.find_by!(email: "rahul@gmail.com"),
  reviewable: Book.find_by!(isbn: "ISBN005")
) do |review|
  review.rating = 5
  review.comment = "A very interesting book."
end

Review.find_or_create_by!(
  member: Member.find_by!(email: "priya@gmail.com"),
  reviewable: Book.find_by!(isbn: "ISBN466")
) do |review|
  review.rating = 4
  review.comment = "An inspiring book."
end

Review.find_or_create_by!(
  member: Member.find_by!(email: "amit@gmail.com"),
  reviewable: Book.find_by!(isbn: "ISBN288")
) do |review|
  review.rating = 5
  review.comment = "Very informative and motivating."
end

Review.find_or_create_by!(
  member: Member.find_by!(email: "neha@gmail.com"),
  reviewable: Author.find_by!(email: "rk@gmail.com")
) do |review|
  review.rating = 4
  review.comment = "A wonderful storyteller."
end

Review.find_or_create_by!(
  member: Member.find_by!(email: "suresh@gmail.com"),
  reviewable: Author.find_by!(email: "apj@gmail.com")
) do |review|
  review.rating = 5
  review.comment = "An inspiring writer."
end




