module AppointmentsHelper

  def time_distance_to_now(appointment)
    distance = (appointment.date - Date.today).to_i
    #Years
    years = distance / 365.0
    if years.to_i > 0
      if years.to_i <= 1
        return t 'time.next_year'
      else
        return t 'time.from_now', time: years.to_i.to_s + ' ' + t('time.years', count: years.to_i)
      end
    end
    if years.to_i < 0
      if years.to_i >= -1
        return t 'time.last_year'
      else
        return t 'time.ago', time: (-years).to_i.to_s + ' ' + t('time.years', count: (-years).to_i)
      end
    end

    #Months
    months = distance / 30.0
    if months.to_i > 0
      if months.to_i <= 1
        return t 'time.next_month'
      else
        return t 'time.from_now', time: months.to_i.to_s + ' ' + t('time.months', count: months.to_i)
      end
    end
    if months.to_i < 0
      if months.to_i >= -1
        return t 'time.last_month'
      else
        return t 'time.ago', time: (-months).to_i.to_s + ' ' + t('time.months', count: (-months).to_i)
      end
    end

    #Days
    days = distance
    if days.to_i > 0
      if days.to_i <= 1
        return t 'time.tomorrow'
      else
        return t 'time.from_now', time: days.to_i.to_s + ' ' + t('time.days', count: days.to_i)
      end
    end
    if days.to_i < 0
      if days.to_i >= -1
        return t 'time.yesterday'
      else
        return t 'time.ago', time: (-days).to_i.to_s + ' ' + t('time.days', count: (-days).to_i)
      end
    end

    distance = (appointment.time.seconds_since_midnight - Time.now.seconds_since_midnight)

    #Hours
    hours = distance / 3600
    if hours >= 1
      return t 'time.from_now', time: hours.round.to_s + ' ' + t('time.hours', count: hours.round)
    end
    if hours <= -1
      return t 'time.ago', time: (-hours).round.to_s + ' ' + t('time.hours', count: (-hours).round)
    end

    #Minutes
    minutes = distance / 60
    if minutes >= 1
      return t 'time.from_now', time: minutes.round.to_s + ' ' + t('time.minutes', count: minutes.round)
    end
    if minutes <= -1
      return t 'time.ago', time: (-minutes).round.to_s + ' ' + t('time.minutes', count: (-minutes).round)
    end

    #Seconds
    seconds = distance
    if seconds >= 1
      return t 'time.from_now', time: seconds.round.to_s + ' ' + t('time.seconds', count: seconds.round)
    end
    if seconds <= -1
      return t 'time.ago', time: (-seconds).round.to_s + ' ' + t('time.seconds', count: (-seconds).round)
    end
  end

  def month_day_format(date)
    distance = (date - Date.today).to_i

    if distance.to_i == 0
      return (t 'time.today').humanize
    end
    if distance.to_i == 1
      return (t 'time.tomorrow').humanize
    end
    if distance.to_i == -1
      return (t 'time.yesterday').humanize
    end

    (t('date.day_names')[date.wday]).humanize + ', ' + date.day.to_s
  end
end
