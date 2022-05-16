class Event < ApplicationRecord

   #relation
   belongs_to :admin, class_name: "User"
   has_many :attendances
   has_many :attendants, class_name: "User", through: :attendances

   # validates
   validates :start_date, presence: true
   validates :duration, presence: true, numericality: { greater_than_or_equal_to: 0 }
   validates :title, presence: true, length: { in: 5..140 }
   validates :description, presence: true, length: { in: 20..1000 }
   validates :price, presence: true, numericality: { in: 1..1000 }
   validates :location, presence: true
end
