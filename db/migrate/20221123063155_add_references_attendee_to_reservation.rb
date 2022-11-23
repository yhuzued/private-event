class AddReferencesAttendeeToReservation < ActiveRecord::Migration[7.0]
  def change
    add_reference :reservations, :attendee, foreign_key: { to_table: :users }
  end
end
