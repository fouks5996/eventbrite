class Attendance < ApplicationRecord
   after_create :attendance_send

   def attendance_send
     UserMailer.attendance_email(self).deliver_now
   end


   belongs_to :attendant, class_name: "User"
   belongs_to :event
end