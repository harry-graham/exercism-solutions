class LocomotiveEngineer
  def self.generate_list_of_wagons(*wagon_ids)
    wagon_ids
  end

  def self.fix_list_of_wagons(each_wagons_id, missing_wagons)
    second_to_last, last, locomotive, *remaining = each_wagons_id
    [locomotive, *missing_wagons, *remaining, second_to_last, last]
  end

  def self.add_missing_stops(start_and_finish, **stops_details)
    {**start_and_finish, stops: stops_details.values}
  end

  def self.extend_route_information(route, more_route_information)
    {**route, **more_route_information}
  end
end
