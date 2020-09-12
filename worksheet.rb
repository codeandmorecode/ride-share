########################################################################################################################################################################
# Alice Dilanchian, 9/11/2020
########################################################################################################################################################################
# Step 1: Establish the layers
# In this section of the file, as a series of comments,
# create a list of the layers you identify.
# Which layers are nested in each other?
# Which layers of data "have" within it a different layer?
# Which layers are "next" to each other?

# ANSWER: The outer layer is the one that contains the array. Within that outer layer,
# lays the individual hashes layers (all 11 of them lay next to each other), but they count as one layer,
# then within each "hash layer", there is a series of keys and their corresponding values; one of those keys (:date) contains
# another nested layer, an array of length 3 that stores the date.

########################################################################################################################################################################
# Step 2: Assign a data structure to each layer
# Copy your list from above, and in this section
# determine what data structure each layer should have

# ANSWER: First layer: array; Second layer: hash, Third layer: array

########################################################################################################################################################################
# Step 3: Make the data structure!
# Setup the entire data structure:
# based off of the notes you have above, create the
# and manually write in data presented in rides.csv
# You should be copying and pasting the literal data
# into this data structure, such as "DR0004"
# and "3rd Feb 2016" and "RD0022"

# ANSWER: see code below

arr_of_hashes = [
  { driver_id: "DR0004", date: [02,03,2016], cost: 5, rider_id: "RD0022", rating: 5 },
  { driver_id: "DR0001", date: [02,03,2016], cost: 10, rider_id: "RD0003", rating: 3 },
  { driver_id: "DR0002", date: [02,03,2016], cost: 25, rider_id: "RD0073", rating: 5 },
  { driver_id: "DR0001", date: [02,03,2016], cost: 30, rider_id: "RD0015", rating: 4 },
  { driver_id: "DR0003", date: [02,04,2016], cost: 5, rider_id: "RD0066", rating: 5 },
  { driver_id: "DR0004", date: [02,04,2016], cost: 10, rider_id: "RD0022", rating: 4 },
  { driver_id: "DR0002", date: [02,04,2016], cost: 15, rider_id: "RD0013", rating: 1 },
  { driver_id: "DR0003", date: [02,05,2016], cost: 50, rider_id: "RD0003", rating: 2 },
  { driver_id: "DR0002",  date: [02,05,2016], cost: 35, rider_id: "RD0066", rating: 3 },
  { driver_id: "DR0004", date: [02,05,2016], cost: 20, rider_id: "RD0073", rating: 5 },
  { driver_id: "DR0001", date: [02,05,2016], cost: 45, rider_id: "RD0003", rating: 2 },
  ]

########################################################################################################################################################################
# Step 4: # Step 4: Total Driver's Earnings and Number of Rides
# Use an iteration blocks to print the following answers:
# - the number of rides each driver has given
# - the total amount of money each driver has made
# - the average rating for each driver
# - Which driver made the most money?
# - Which driver has the highest average rating?

# Defines i to use as iteration index, and 3 arrays that will hold total number of rides per driver,
# total earned per driver, total number of rating points per driver, and average rating of each driver, respectively
i = 0
total_rides = [0,0,0,0]
total_earned = [0,0,0,0]
total_points_rating = [0.0,0.0,0.0,0.0]
average_rating = [0.0,0.0,0.0,0.0]

# Defines and initiates j with a value of 0 then assigns value for j depending on driver id invoked within the loop
until i == arr_of_hashes.length do
  
  j = 0
  
  if arr_of_hashes[i][:driver_id] == "DR0001"
    j = 0
  elsif arr_of_hashes[i][:driver_id] == "DR0002"
    j = 1
  elsif arr_of_hashes[i][:driver_id] == "DR0003"
    j = 2
  elsif arr_of_hashes[i][:driver_id] == "DR0004"
    j = 3
  end

  # Using the variable j, we calculate the total number of rides for each driver, and store
  # that info in the total_rides array
  total_rides[j] += 1

  # Using the variable j, we calculate the total earned for each driver
  total_earned[j] += arr_of_hashes[i][:cost]

  # Using the variable j, we calculate the total amount of points for the rating of each driver
  total_points_rating[j] += arr_of_hashes[i][:rating]

  # Using the variable j, and the total_points_rating, and the total_rides arrays, we calculate the average rating for each driver
  average_rating[j] = total_points_rating[j] / total_rides[j]

  # we increment by 1
  i += 1

end

# Calculates the number of rides each driver has given, the total amount of money each driver has made, and the average rating for each driver, rounded to one decimal place
k=0
until k == 4 do
  puts "Driver with ID# DR000#{k+1} executed a total of #{total_rides[k]} rides, made a total of $#{total_earned[k]}, and got an average rating of #{average_rating[k].round(1)}."
  k += 1
end

# Method to_screen displays driver with highest earning, and driver with highest rating average
def to_screen (total_earned, average_rating)
  puts "Driver with ID# DR000#{total_earned.rindex(total_earned.max) + 1} made the most money: $#{total_earned.max}"
  puts "Driver with ID# DR000#{average_rating.rindex(average_rating.max) + 1}  had the highest rating: #{average_rating.max.round(1)}"
end

# invokes to_screen method on total_earned and average_rating
puts to_screen(total_earned, average_rating)
