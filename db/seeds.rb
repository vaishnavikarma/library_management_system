# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


Author.find_or_create_by!(email:"rk@gmail.com") do |author|
    author.name = "R.K.Narayan"
    author.bio = "Indian author"
end
Author.find_or_create_by!(email:"apj@gmail.com") do |author|
    author.email = "A.P.J Kalam"
    author.bio ="Indian aerospace scientist"
end
Author.find_or_create_by!(email:"ruskin@gmail.com") do |author|
    author.name ="Ruskin Bond"
    author.bio = "A writer"
end

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








