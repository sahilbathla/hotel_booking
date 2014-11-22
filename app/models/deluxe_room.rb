class DeluxeRoom < Room
  def amenities
    super + ['Queen Size Bed']
  end
end