# require 'gmail'


class User

	# HANDLES USER INFORMATION

	attr_accessor :username, :times_avail, :email

	def initialize (name)
		
		@username = name

		@times_avail = [
			# Sunday - [0]
			["900" => false, "1000" => false, "1100" => false, "1200" => false, 
				"1300" => false, "1400" => false, "1500" => false, "1600" => false, 
				"1700" => false],
			]

	end
end	

class Schedule

	def self.execute
		puts "Welcome to BlockTalk, what is your name?"
		username = gets.chomp
		user1 = User.new(username)

		puts "Hello #{user1.username}. What is your email?"
		user1.email = gets.chomp!
		
		puts "Who would you like to speak with?"
		user2 = gets.chomp!
		puts "What is their email address?"
		user2_email = gets.chomp!

		puts "Here are 5 time blocks for today and tomorrow. Please
		enter the option numbers of the three (3) times that work best for you,
		separated by commas (i.e. 3,1,4)"
		
		puts randomize.each

		# counter = 1
		# t = randomize
		# t.inspect
		# t.each do |time|
		# 	"#{counter}.  #{time}"
		# 	counter + 1
		# end

		user1_choices = gets.chomp!

		puts "Fantastic. Your times have been sent to #{user2} at #{user2_email}. 
		When they respond, you'll get an email confirmation from us."

		puts "Hello, #{user2}, #{user1} wants to BLOCK YOU OUT. You like, avail?"
		
		# in case we want to just display user1's choices only:
		user2_choices = user1_choices

		puts user2_choices



		end

		# 
		
		# puts "Great. Your preferences have been sent to #{user2} at #{user2_email}. 
		# You'll receive an email when we hear back with your confirmed time."


	end

	def randomize

		now = Time.now  #current time

		tomorrow_index = now.wday + 1 # tomorrow (index)
		dayafter_index = now.wday + 2 # next day (index)

		if tomorrow_index == 6       # to loop day values
			dayafter_index = 0
		elsif tomorrow_index == 7
				tomorrow_index = 0
				dayafter_index = 1
		end

		indeces = {0 => "Sunday", 1 => "Monday", 2 => "Tuesday", 3 => "Wednesday", 4 => "Thursday", 
			5 => "Friday", 6 => "Saturday"}

		tomorrow = indeces[tomorrow_index] # tomorrow (day)
		dayafter = indeces[dayafter_index] # next day (day)

		times = [900, 1000, 1100, 1200, 1300, 1400, 1500, 1600, 1700, 1800, 1900, 2000, 2100]

		#GENERATE TOMORROW'S TIMES
		# random unique tomorrow times
		tomorrow_times = []
		
		until tomorrow_times.length == 3 do
			tomorrow_times << times[rand(13)]
			tomorrow_times.uniq!
		end

		# sort tomorrow's times in order
		tomorrow_times = tomorrow_times.sort
		
		# add day
		tomorrow_times_with_day = []

		tomorrow_times.each do |time|
			tomorrow_times_with_day << "#{tomorrow} at #{time}"
		end

		puts "--------"

		#GENERATE DAY AFTER'S TIMES
		# random unique dayafter times
		dayafter_times = []

		until dayafter_times.length == 2
			dayafter_times << times[rand(13)]
			dayafter_times.uniq!
		end

		# sort dayafter's times in order
		dayafter_times = dayafter_times.sort

		# add day
		dayafter_times_with_day = []

		dayafter_times.each do |time|
			dayafter_times_with_day << "#{dayafter} at #{time}"
		end

		# merge times to one array
		alltimes_user1 = tomorrow_times_with_day.push(dayafter_times_with_day[0], dayafter_times_with_day[1])
		return alltimes_user1

end






