class User < ApplicationRecord
   has_many :attendances
   has_many :events, through: :attendances

   # validates
   validates :email, presence: true, uniqueness: true
   validates :first_name, length: { minimum: 2 }
   validates :description, length: { maximum: 500 }
   #validates :password, length: { in: 6..20 }
end
