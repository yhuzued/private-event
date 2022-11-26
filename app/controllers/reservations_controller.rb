class ReservationsController < ApplicationController
  
  def index
    @event = Event.all
  end

  def new
    @event = Event.find(params[:event_id])
    @reservation = @event.reservations.build(event_id: params[:id], attendee_id: current_user.id)
  end

  def create
    @event = Event.find(params[:event_id])
    @reservation = @event.reservations.build(event_id: params[:id], attendee_id: current_user.id)

    respond_to do |format|
      if @event.save
        format.html { render :show, notice: "Reservations was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :show, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:attendee)
  end
end
