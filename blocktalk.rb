# @username
# Trying to sched time with User 2
# Chooses times from User2's array

# User 2
# Has certain available times, others unavailable.
# Times can be in an array

# API: Gmail will send an email confirmation of the meeting.

class User

# HANDLES USER AVAILABILITY AND APPOINTMENTS

	@@users = []

	attr_accessor :username, :times_avail, :email

	def initialize (name)
		
		@username = name

		@times_avail = [
			# Sunday - [0]
			["900", "1000", "1100", "1200", "1300", "1400", "1500", "1600", 
			"1700"],

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
		
		@appointments = {}

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

	# BOOKS USERS, SENDS CONFIRMATION

	# require _________

	def is_available? (user1, avail_day_index, avail_time)
		user1.times_avail[avail_day_index].include?(avail_time)
	end

	def mutual_avail? (user1, user2, avail_day_index, time)
		if user1.is_available?(avail_day_index, time) == true && 
			user2.is_available?(avail_day_index, time) == true
			return true
		else
			return false
		end
	end

	def book_appt 
		if mutual_avail? () == true
	# 	end
	# end


	def self.execute
		puts "Welcome to BlockTalk, what is your name?"
		username = gets.chomp
		User.new(username)
		puts "Hello #{username}. What is your email?"
		@email = gets.chomp!

		# puts "Great! We've marked you as available Sun-Sat from 9a-5p. If you wish
		# to edit your schedule, please type '______'"

		# puts "Who would you like to speak with?"
		# user2 = gets.chomp!

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
