require './prisoner.rb'
require './warden.rb'
require './switchbox.rb'

class PrisonerPuzzle
	attr_accessor :warden_gentles
	def initialize num_of_prisoners=23, time=72, fools=0, foolishness=0
		box = Switchbox.new
		prisoners = []
		(num_of_prisoners-fools).times { prisoners.push(Prisoner.new(box, num_of_prisoners))}
		fools.times { prisoners.push(Prisoner.new(box, num_of_prisoners, false, true, foolishness))}
		n = 0
		prisoners.each do |p| 
			p.id = n
			n += 1	
		end	
		@warden_gentles = Warden.new(prisoners)
		@warden_gentles.period = time
		prisoners.sample.leader = true

		prisoners.each do |p| 
			p.warden = @warden_gentles
		end

		prisoners.each do |p|
			if p.leader
				if p.fool
					puts "Durr, I'm the leader"
				else
					puts "I am Prisoner ##{p.id}, and I am the leader."
				end
			end
		end

	end

	def run
		while not @warden_gentles.done
			@warden_gentles.take_into_room
		end
		puts "That took a total of #{@warden_gentles.hours_elapsed/24} days."
		@warden_gentles.done = false
		@warden_gentles.hours_elapsed = 0
		@warden_gentles.visited.fill(false)
	end
end	