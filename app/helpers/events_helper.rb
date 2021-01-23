module EventsHelper
  # checks if the user current user is already attending meeting
  def invalid_invitee?(user)
    user.id == @event.creator_id || @event.attendees.include?(user) || @event.invitees.include?(user)
  end

  def user_invited?
    @event.invitee_ids.include?(session[:user_id])
  end

  def user_not_attending?
    !@event.attendee_ids.include?(session[:user_id])
  end

  def show_more_to_invite?
    @event.attendees.count + @event.invitees.count + 1 != @users.count && @event.creator_id == session[:user_id]
  end
end
