class LuxuryRoom < Room
  def amenities
    super + ['Queen Size Bed', 'Pool Facing']
  end
end