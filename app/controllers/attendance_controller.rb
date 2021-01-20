class AttendanceController < ApplicationController
  before_action :signed_in?, only: [:create]

  def create
    @attendance = Attendance.new
    @attendance.attendee_id = session[:user_id]
    @attendance.event_id = params[:event]
    if @attendance.save
      redirect_to event_path(params[:event])
    else
      p @attendance.errors
    end
  end

  def signed_in?
    return true if session[:user_id] && session[:user_name]

    redirect_to session_new_path
  end
end
