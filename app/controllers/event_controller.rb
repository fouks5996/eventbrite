class EventController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.create(
      start_date: params[:start_date], 
      duration: params[:duration],
      title: params[:title],
      description: params[:description],
      price: params[:price],
      location: params[:location],
      admin: current_user,
    )

    if @event.save 
      flash[:success] = "L'event a bien été crée !!"
      redirect_to "/"
    else 
      flash[:error] = "Réessayer"
      render 'event/new'
    end
  end
end
