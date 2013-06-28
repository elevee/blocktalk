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

		puts "Here are 5 time blocks for today and tomorrow:"
		
		t = randomize
		t.each do |key, value|
			puts "#{key}.  #{value}" 
		end

		puts "Please enter the first option time that works 
		best for you (ex. 2)"

		user1_choices = []
		user1_first = gets.chomp.to_i

		puts "Alright, next preference?"

		user1_second = gets.chomp.to_i
		
		puts "And your final preference?"

		user1_third = gets.chomp.to_i

		puts t.values_at[user1_first]

		user1_choices << t[user1_first]
		user1_choices << t[user1_second] 
		user1_choices << t[user1_third]

		user2_hash = {}

		user1_choices.each_with_index do |value, index|
			user2_hash[index] = value
		end

		puts "Hello, #{user2}, #{username} wants to BLOCK YOU OUT. You like, avail?
		Please choose a numbered option below (ex. 2)"
		
		user2_hash.each do |key, value|
			puts "#{key}.  #{value}" 
		end

		user2_choice = gets.chomp.to_i

		confirm_time = user2_hash[user2_choice]

		puts "YAAAAY yall are confirmed like whoa. Write this down!
		
		#{confirm_time}

		Don't be late." 

		puts "--------EMAIL TO USER1 & USER2--------"
		puts "YO. SUP. You're confirmed to meet with #{user2}
		on #{confirm_time}. Away with yourselves."

	end

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

		# Interpreting day indeces into day values
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
		
		alltimes_hash = {}

		alltimes_user1.each_with_index do |value, index|
			alltimes_hash[index] = value
		end

		return alltimes_hash

end
