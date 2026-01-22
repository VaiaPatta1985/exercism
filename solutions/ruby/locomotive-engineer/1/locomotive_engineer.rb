class LocomotiveEngineer
  def self.generate_list_of_wagons(*wagon_ids)
    return wagon_ids
  end

  def self.fix_list_of_wagons(each_wagons_id, missing_wagons)
    first, second, third, *rest = each_wagons_id
    return [third, *missing_wagons, *rest, first, second]
  end

  def self.add_missing_stops(routing_hash, *stops_hash, **stops_pairs)
    if stops_hash = {}
      stops_hash = stops_pairs
    end
    #stops_array = stops_hash.to_a
    #assume already sorted?
    return {**routing_hash, stops: stops_hash.values}
  end

  def self.extend_route_information(route, more_route_information)
    return {**route, **more_route_information}
  end
end
