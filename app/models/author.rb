class Author < ApplicationRecord
    has_many:books 
    has_many:reviews,as: :reviewable
    validates:name, presence: true
    validates:email, uniqueness: true,presence: true
end
