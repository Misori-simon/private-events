class AttendanceController < ApplicationController
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
end
