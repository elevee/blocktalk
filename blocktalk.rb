# User 1 
# Trying to sched time with User 2
# Chooses times from User2's array

# User 2
# Has certain available times, others unavailable.
# Times can be in an array

# API: Gmail will send an email confirmation of the meeting.


class Blocktalk

# require _________

attr_accessor :username, :times_avail, :email


def initialize
	@times_avail = [
		# Sunday - [0]
		["900", "1000", "1100", "1200", "1300", "1400", "1500", "1600", 
		"1700"],

		# # #Monday - [1]
		["9:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", 
		"17:00"],

		# # #Tuesday - [2]
		["9:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", 
		"17:00"],

		# # #Wednesday - [3]
		["9:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", 
		"17:00"],

		# # #Thursday - [4]
		["9:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", 
		"17:00"],

		# # #Friday - [5]
		["9:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", 
		"17:00"],

		# # #Saturday - [6]
		["9:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", 
		"17:00"],

	]
	
	@appointments = {}

end

def make_unavailable (unavail_day_index, unavail_time)
	@times_avail[unavail_day_index].reject! {|time| time == unavail_time}
end

def make_available (avail_day_index, avail_time)
	a = @times_avail[avail_day_index].push(avail_time)
end

def is_available? (avail_day_index, avail_time)
	@times_avail[avail_day_index].include?(avail_time)
end

def mutual_avail? (user2, avail_day_index, time)
	if self.is_available?(avail_day_index, time) == true && 
		user2.is_available?(avail_day_index, time) == true
		return true
	else
		return false
	end
end

# def book_appt 
# 	if mutual_avail? () == true
# end

#Create another availability class, link them up, work with it there.

end
