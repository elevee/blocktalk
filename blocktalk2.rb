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

class Scheduler
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
	end

	def randomizer
		now = Time.now  #current time
		puts now.wday #day 
		# next day
		# day after

		now

		puts "Here are 5 random times generated for the next two days. Please choose three options 
		separated by commas. If you don't like them, simply type 'more'" 
	end

end




