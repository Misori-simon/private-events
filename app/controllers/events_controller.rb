class EventsController < ApplicationController
  before_action :set_event, only: [:show]
  before_action :signed_in?, only: [:new]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @users = User.all
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.creator_id = session[:user_id]

    if @event.save
      flash.notice = 'Event was successfully created.'
      redirect_to @event
    else
      errors = @event.errors.map(&:full_message)
      flash.alert = errors.join('<br/>').html_safe
      render :new
    end
  end

  def signed_in?
    return true if session[:user_id] && session[:user_name]

    redirect_to session_new_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:description, :date, :creator_id)
  end
end
