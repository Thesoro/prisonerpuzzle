class Warden
	attr_accessor :roster, :prisoners, :visited, :done, :hours_elapsed, :period, :done
	def initialize *prisoners
		@roster = []
		@visited = []
		prisoners.flatten.each do |p|
			@roster.push(p)
			@visited[p.id] = false
		end
		@done = false
		@hours_elapsed = 0
		@period = 0
	end

	def take_into_room
		selectee = @roster.flatten.sample
		selectee.visit
		@visited[selectee.id.to_i] = true
		@hours_elapsed += rand(@period+1)
	end

	def finish
		if @visited.all?
			puts "You're all free to go."
		else
			puts "To the alligators with you!"
		end
		@done = true
	end
end