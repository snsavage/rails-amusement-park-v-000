class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    return ride_error_text if ride_error?

    user.tickets -= attraction.tickets
    user.nausea += attraction.nausea_rating
    user.happiness += attraction.happiness_rating
    user.save
  end

  def ride_error?
    !!ride_error_text
  end

  def ride_error_text
    @ride_error ||= ride_error
  end

  private
  def ride_error
    error_text = ["Sorry."]

    unless has_required_tickets?
      error_text << "You do not have enough tickets to ride the #{attraction.name}."
    end

    unless has_required_height?
      error_text << "You are not tall enough to ride the #{attraction.name}."
    end

    #Check to see if errors have been triggered by testing error_text.
    return error_text.join(" ") if error_text.count > 1
  end

  def has_required_tickets?
    user.tickets >= attraction.tickets
  end

  def has_required_height?
    user.height >= attraction.min_height
  end
end

