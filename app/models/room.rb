class Room < ActiveRecord::Base
  #Associations
  has_many :bookings, dependent: :destroy

  #Validations
  validates :name, :type, :price, presence: true 

  #Ammenities (assuming they are not resources themselves)
  def amenities
    %w(Bathroom Televison Towels)
  end

  #Scopes
  #Check room availability in date range
  scope :available_in_range, ->(start_date, end_date) do 
    booked_rooms = Booking.select('DISTINCT room_id').where.not(Booking.arel_table[:start_date].gt(end_date).
      or(Booking.arel_table[:end_date].lt(start_date)))
    where.not(id: booked_rooms)
  end

  #Find rooms by type
  scope :by_type, ->(type = nil) { where(type: type) if type }
end
