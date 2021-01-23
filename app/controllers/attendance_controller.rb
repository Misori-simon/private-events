class AttendanceController < ApplicationController
  before_action :signed_in?, only: [:create]

  def create
    @attendance = Attendance.new
    @attendance.attendee_id = session[:user_id]
    @attendance.event_id = params[:event]
    if @attendance.save
      if params[:invitation]
        redirect_to invitation_destroy_path(id: params[:invitation], event: params[:event])
      else
        redirect_to event_path(params[:event])
      end
    else
      flash.alert = 'Unable To Join'
      redirect_to event_path(params[:event])
    end
  end

  def signed_in?
    return true if session[:user_id] && session[:user_name]

    redirect_to session_new_path
  end
end
