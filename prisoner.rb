class Prisoner
	attr_writer :warden
	attr_accessor :have_flipped, :leader, :id, :fool
	def initialize switchbox=nil, prisoner_count=0, leader = false, fool = false, foolishness = 0
		@have_flipped = false
		@switchbox = switchbox
		@leader = leader
		@warden = nil
		@prisoner_count = prisoner_count
		@count = 0
		@fool = fool
		@foolishness = foolishness
		@id = nil
	end

	def visit
		if @leader
			if @fool and rand(100)+1 < @foolishness
				@count += 1
			end
			if @count >= @prisoner_count + 1
				puts "I am the leader of this prison gang, and I say we are free."
				self.declare_finished(@warden)
			elsif @switchbox.left == :OFF
				@count += 1
				@switchbox.left_flip
				puts "Alright, one more prisoner has been here. That's #{@count} so far."
			else
				@switchbox.right_flip
			end


		else
			if @switchbox.left == :ON and @have_flipped == false
				@switchbox.left_flip
				have_flipped == true
				puts "New room!"
			else
				@switchbox.right_flip
				print "."	
			end
			if @fool and rand(100)+1 < @foolishness
				have_flipped = false
			end
		end
	end

	def declare_finished warden
		warden.finish
		@count = 0
	end
end
