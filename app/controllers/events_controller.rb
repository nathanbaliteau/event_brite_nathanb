class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new  
  end

  def create
    @event = Event.new(title: params[:title], location: params[:location], start_date: params[:start_date], description: params[:description], duration: params[:duration], price: params[:price], admin: current_user)

    if @event.save
      redirect_to event_path(@event.id)
    else
      render :new
    end
  end

end
