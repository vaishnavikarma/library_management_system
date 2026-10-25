class Member < ApplicationRecord

    belongs_to :member, class_name:"Member", optional: true
    has_many :subordinates, class_name:"Member",foreign_key:"refered_by_id"
    has_many :borrowings
    has_many :books,through: :borrowings

    validates :name, presence: true
    validates :email,uniqueness: true,format: {with:URI::MailTo::EMAIL_REGEXP}

    public
    def borrowing_limit
        if(type == "Student")
            return 3
         elsif(type == "Faculty")
            return 10
        end
    end
end
