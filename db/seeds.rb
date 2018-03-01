Location.destroy_all
Activity.destroy_all

@location_1 = Location.create(open_year: 2014, size: 2500, city: "Detroit")
@location_2 = Location.create(open_year: 2018, size: 2050, city: "Chicago")
@location_3 = Location.create(open_year: 2007, size: 3250, city: "Milwalkee")
@location_4 = Location.create(open_year: 2003, size: 1600, city: "Cleveland")

@activity_1 = Activity.create(name: "Fetch the Stick", description: "Sticks are thrown far and dogs run to retrieve them", ideal_type: "energetic", ideal_size: "big", energy_usage: "high")
@activity_2 = Activity.create(name: "Solve the Puzzle", description: "Treats are available for the dog that can solve the puzzle", ideal_type: "smart", ideal_size: "medium", energy_usage: "low")
@activity_3 = Activity.create(name: "Obstacle Course", description: "Dogs run through, over, and around a bunch of different obstacles", ideal_type: "agile", ideal_size: "medium", energy_usage: "high")
@activity_4 = Activity.create(name: "Indoors Ball Bounce", description: "A bouncy ball is thrown indoors for the dog to chase and catch", ideal_type: "energetic", ideal_size: "small", energy_usage: "high")


activity_group = [@activity_1, @activity_2, @activity_3, @activity_4]

activity_group.each_with_index do |val, index|
  if index.odd?
    @location_1.activities << val
  end
end

activity_group.each_with_index do |val, index|
  if index.even?
    @location_2.activities << val
  end
end

activity_group.each do |val|
  @location_3.activities << val
end

@location_4.activities << @activity_4