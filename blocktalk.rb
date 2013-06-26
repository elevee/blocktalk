# @username
# Trying to sched time with User 2
# Chooses times from User2's array

# User 2
# Has certain available times, others unavailable.
# Times can be in an array

# Scheduler's job is to compare availabilities between 2 users and return mutual 
# availability times. 

# Notifier
# Confirms appts with Gmail API: Gmail will send an email confirmation of the meeting.

requre "gmail"

class User

	# HANDLES USER INFORMATION

	@@users = []

	attr_accessor :username, :times_avail, :email

	def initialize (name)
		
		@username = name

		@times_avail = [
			# Sunday - [0]
			["900" => false, "1000" => false, "1100" => false, "1200" => false, 
				"1300" => false, "1400" => false, "1500" => false, "1600" => false, 
			"1700" => false],

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
		
		@appointments = []

		@@users << self
	end

	def make_unavailable (unavail_day_index, unavail_time)
		@times_avail[unavail_day_index].reject! {|time| time == unavail_time}
	end

	def make_available (avail_day_index, avail_time)
		a = @times_avail[avail_day_index].push(avail_time)
		a.sort_by(&:to_i)
	end

end


class Blocktalk

	def self.day_indeces (day)
		indeces = {"Sunday" => 0, "Monday" => 1, "Tuesday" => 2, "Wednesday" => 3, 
			"Thursday" => 4, "Friday" => 5, "Saturday" => 6}
		day_index = indeces[day]
	end

	# BOOKS USERS, SENDS CONFIRMATION

	def self.is_available? (user1, avail_day_index, avail_time)
		user1.times_avail[avail_day_index].include?(avail_time)
	end

	def self.mutual_avail? (user1, user2, avail_day_index, time)
		if user1.is_available?(avail_day_index, time) == true && 
			user2.is_available?(avail_day_index, time) == true
			return true
		else
			return false
		end
	end

	# def book_appt 
	# 	if mutual_avail? () == true
	# # end
	# end


	def self.execute
		users = []
		puts "Welcome to BlockTalk, what is your name?"
		username = gets.chomp
		user1 = User.new(username)
		

		puts "Hello #{user1.username}. What is your email?"
		user1.email = gets.chomp!

		users << user1
		
		puts "Who would you like to speak with?"
		user2 = gets.chomp!
		puts "What is their email address?"
		user2_email = gets.chomp!
		puts "Let's create 3 time blocks that work for you. What day would you like
		to meet #{user2}?"
		day1 = gets.chomp!
		puts "OK, what time on #{day1}?"
		time1 = gets.chomp!
		puts "Great. In case #{user2} can't do then, please add an alternative time. 
		Let's start with the day."
		day2 = gets.chomp!
		puts "and a time on #{day2}?"
		time2 = gets.chomp!
		puts "Last time. Let's choose an alternative time to meet. Day?"
		day3 = gets.chomp!
		puts "...and time on #{day3}?"
		time3 = gets.chomp!

		@timeblocks = []
		@timeblocks << {day1 => time1, day2 => time2, day3 => time3}

		puts "Excellent! We have sent an email to #{user2} at #{user2_email}. "


		# puts "Great! We've marked you as available Sun-Sat from 9a-5p. Do you wish
		# to mark yourself unavailable?"

		# e = gets.chomp!

		# if e == "yes"
		# 	while e == "yes"
		# 	puts "What day are you unavailable?"
		# 	day = gets.chomp!
		# 	puts "At what time on #{day} are you unavailable?"
		# 	time = gets.chomp!
		# 		day_index = Blocktalk.day_indeces(day)
		# 	u.make_unavailable(day_index, time)
		# 	puts "Great. #{day} at #{time} has been removed from your availability."
		# 	puts "#{day}" 
		# 	puts "-------------"
		# 	puts u.times_avail[day_index]
		# 	puts "Are there any more times you are unavailable?"
		# 	end
		# end



		# puts "OK, you and #{user2} are both available at the following times:"
		# #each loop on mass mutual avail? method
		# 	self.times_avail[avail_day_index] & user2.times_avail[avail_day_index]
	end


	# puts "What day would you like to book?"
	# selection_day = gets.chomp!

	# puts "What time?"
	# selection_time = gets.chomp!

	# if @username.mutual_avail?(user2, selection_day, selection_time) == true
		# booked_appt = book_method
	# else
	# 	puts "Error Message. That time is not available, please choose another time"
	#   end

	# if booked_appt_is included in user2.@appointments
	# 	puts "You are confirmed for your appointment with #{user2}. An email has been
	# 	sent to #{@email}"

	#Create another availability class, link them up, work with it there.
end
