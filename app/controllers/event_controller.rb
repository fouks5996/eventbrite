class EventController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy, :update, :show]


  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
    @participated = participated?
  end

  def create
    @event = Event.create(
      start_date: params[:start_date], 
      duration: params[:duration],
      title: params[:title],
      description: params[:description],
      price: params[:price],
      location: params[:location],
      admin: current_user
    )

    if @event.save 
      flash[:success] = "L'event a bien été crée !!"
      redirect_to "/"
    else 
      flash[:error] = "Réessayer"
      render 'event/new'
    end


  end

  def edit 
    @event = Event.find(params[:id])
  end


  def update
    @event = Event.find(params[:id])
    event_params = params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location, admin: current_user)
    if @event.update(event_params)
      flash[:success] = "L'event à bien été édité"
      redirect_to action: "show", notice: 'Success', :id => @event.id
    else
      render :action => 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:success] = "L'event à bien été supprimé"
    redirect_to root_path
  end

  private 

  def participated?
    Event.find(params['id']).attendants.ids
  end

end
