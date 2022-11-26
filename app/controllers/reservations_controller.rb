class ReservationsController < ApplicationController
  before_action :authenticate_user!, only: %i[ new create ]

  def index
    @event = Event.all
  end

  def new
    @event = Event.find(params[:event_id])
    @reservation = @event.reservations.build(attendee_id: current_user.id)
  end

  def create
    @event = Event.find(params[:event_id])
    @check_reservation = @event.reservations.where(attendee_id: current_user.id).exists?

    unless @check_reservation
      @reservation = @event.reservations.build(event_id: params[:id], attendee_id: current_user.id)

      if @reservation.save
        redirect_to @event, notice: "Reservations was successfully created."
      end   
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:attendee)
  end
end
