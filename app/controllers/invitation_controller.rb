class InvitationController < ApplicationController
  before_action :signed_in?, only: [:create]

  def create
    @invitation = Invitation.new
    @invitation.event_id = params[:event]
    @invitation.invitee_id = params[:user]
    (@invitation.save)? flash.notice = "Invitation Sent Successfully" : flash.alert = "Invitation Not Sent"
    redirect_to event_path(params[:event])

  end

  def destroy
  end

  def signed_in?
    return true if session[:user_id] && session[:user_name]
    redirect_to session_new_path
  end
end
