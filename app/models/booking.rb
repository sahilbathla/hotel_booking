class Booking < ActiveRecord::Base
  #Associations
  belongs_to :room
  belongs_to :user

  #Validations
  validates :user, :room, :start_date, :end_date, :price, :persons, presence: true
  validate :check_dates

  #Callbacks
  before_validation :set_price_for_room 

  def days
    (end_date - start_date).to_i
  end

  private
    def check_dates
      start_date <= end_date && start_date >= Date.current && end_date <= (Date.current + 6.months)
    end

    #Fetch always from backend to prevent any price alteration through html
    def set_price_for_room
      room = Room.find_by(id: room_id)
      self.price = room.price * days if room
    end
end
