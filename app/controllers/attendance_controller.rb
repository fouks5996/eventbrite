class AttendanceController < ApplicationController
   def new

   end

   def index
    @attends = Event.find(params[:event_id]).attendants
   end
 end