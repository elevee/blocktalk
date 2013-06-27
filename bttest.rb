def randomizer
	now = Time.now  #current time
	puts tomorrow_index = now.wday + 1 # tomorrow (index)
	puts dayafter_index = now.wday + 2 # next day (index)

	indeces = {0 => "Sunday", 1 => "Monday", 2 => "Tuesday", 3 => "Wednesday", 4 => "Thursday", 
		5 => "Friday", 6 => "Saturday"}

	tomorrow = indeces[tomorrow_index] # tomorrow (day)
	dayafter = indeces[dayafter_index] # next day (day)

	times = [900, 1000, 1100, 1200, 1300, 1400, 1500, 1600, 1700, 1800, 1900, 2000, 2100]

	#Generate tomorrow's times

	# puts rand(times)
	tomorrow_times = []
	x=0
	until x > 3 do
		puts times[rand(13)].each do |time, tomorrow|
		tomorrow_times << time
		x += 1
		tomorrow_times
		end
	end
	puts tomorrow_times

	dayafter_times



		#Generate next day's times
end