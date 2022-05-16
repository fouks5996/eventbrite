class User < ApplicationRecord

   after_create :welcome_send

   def welcome_send
     UserMailer.welcome_email(self).deliver_now
   end

   # relations
   has_many :attendant_events, foreign_key: 'attendant_id', class_name: 'Attendance'
   has_many :admin_events, foreign_key: 'admin_id', class_name: 'Event'

   # validates
   validates :email, presence: true, uniqueness: true
   validates :first_name, length: { minimum: 1 }
   validates :description, length: { maximum: 500 }
   #validates :password, length: { in: 6..20 }
end
