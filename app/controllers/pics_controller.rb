class PicsController < ApplicationController
   def create
      @event = Event.find(params[:event_id])
      @event.pic.attach(params[:pic])
      redirect_to(event_path(@event))
    end
end
