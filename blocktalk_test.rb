shehzan = User.new("Shehzan")
nathaniel = User.new("Nathaniel")

shehzan.times_avail = [
	# Sunday - [0]
	["1400", "1700"],

	# # #Monday - [1]
	["900", "1000", "1100", "1200", "1300", "1400", "1500", "1600", 
	"1700"],

	# # #Tuesday - [2]
	["900", "1000", "1100", "1200", "1300", "1400", "1500", "1600", 
	"1700"],

	# # #Wednesday - [3]
	["900", "1000", "1100", "1200", "1300", "1400", "1500", "1600", 
	"1700"],

	# # #Thursday - [4]
	["900", "1000", "1100", "1200", "1300", "1400", "1500", "1600", 
	"1700"],

	# # #Friday - [5]
	["900", "1000", "1100", "1200", "1300", "1400", "1500", "1600", 
	"1700"],

	# # #Saturday - [6]
	["900", "1000", "1100", "1200", "1300", "1400", "1500", "1600", 
	"1700"],

	]

nathaniel.times_avail = [
	# Sunday - [0]
	["1300", "1400", "1600", "1700"],

	# # #Monday - [1]
	["900", "1000", "1100", "1200", "1300", "1400", "1500", "1600", 
	"1700"],

	# # #Tuesday - [2]
	["900", "1000", "1100", "1200", "1300", "1400", "1500", "1600", 
	"1700"],

	# # #Wednesday - [3]
	["900", "1000", "1100", "1200", "1300", "1400", "1500", "1600", 
	"1700"],

	# # #Thursday - [4]
	["900", "1000", "1100", "1200", "1300", "1400", "1500", "1600", 
	"1700"],

	# # #Friday - [5]
	["900", "1000", "1100", "1200", "1300", "1400", "1500", "1600", 
	"1700"],

	# # #Saturday - [6]
	["900", "1000", "1100", "1200", "1300", "1400", "1500", "1600", 
	"1700"],

]

puts shehzan.times_avail


# def mutual_avail? (user2, avail_day_index, time)
# 		if user1.is_available?(avail_day_index, time) == true && 
# 			user2.is_available?(avail_day_index, time) == true
# 			return true
# 		else
# 			return false
# 		end
# 	end

# def mutual_avail_day (user2, avail_day_index)
# 	self.times_avail[avail_day_index].each do |time|
# 		puts time
# 	end
# end



shehzan.mutual_avail_day(nathaniel, 0)
	shehzan.mutual_avail_day[0].each do |time|
		puts time
	end




# puts "Welcome to BlockTalk, what is your name?"
# 		username = gets.chomp
# 		User.new(username)
# 		puts "Hello #{username}. What is your email?"
# 		@email = gets.chomp!

# 		puts "Great! We've marked you as available Sun-Sat from 9a-5p. If you wish
# 		# to edit your schedule, please type '______'"

# 		puts "Who would you like to speak with?"
# 		user2 = gets.chomp!

# 		puts "OK, you and #{user2} are both available at the following times:"
# 		# each loop on mass mutual avail? method
# 			self.times_avail[avail_day_index] & user2.times_avail[avail_day_index]
	
