# Model for hotel, using singleton pattern as only 1 hotel will ever be instantiated
class Hotel
  include Singleton

  #Class Methods
  def self.name
    instance.name
  end

  def self.method_missing(method, *args, &block)
    instance.public_send("#{ method }", *args, &block)
  end

  #Instance Methods

  def rooms
    Room.all
  end

  #Initiate hotel values
  instance.instance_eval do
    @name = 'Hotel Royal'
    @mobile_number = '889911223344'
  end

  attr_reader :name, :mobile_number
end
