module AppointmentsHelper
  def time_distance_to_now(appointment)
    date_time = (appointment.date.to_s + " " + appointment.time.to_s).to_time
    distance = (date_time - Time.now) / 3600.0 / 4
    years = distance
    if years > 0
        t 'appointments.from_now', time: years
    else
        t 'appointments.ago', time: years
    end
  end
end
