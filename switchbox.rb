class Switchbox
	attr_accessor :right, :left
	def initialize
		if rand(2) == 0
			@left = :ON
		else
			@left = :OFF
		end

		if rand(2) == 0
			@right = :ON
		else
			@right = :OFF
		end
	end

	def left_flip
		if @left == :ON
			@left = :OFF
		else
			@left = :ON
		end
	end

	def right_flip
		if @right == :ON
			@right = :OFF
		else
			@right = :ON
		end
	end
end