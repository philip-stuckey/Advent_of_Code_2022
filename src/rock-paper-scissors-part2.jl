module rock_paper_scissors_part2
	include("rock-paper-scissors2.jl")

	using .rock_paper_scissors2: Shape, game_score, shape_score, shape_map
	using .rock_paper_scissors2: winning_moves, score, game_score, shape_score

	wins = Dict(winning_moves)
	looses = Dict(reverse.(winning_moves))
	draws = Dict(s => s for s in first.(winning_moves))

	outcome_map =Dict(
		'X' => wins,
		'Y' => draws,
		'Z' => looses
	)
		
	const first_char = first
	const last_char = last
	
	function parse_strategum(line)
		move = shape_map[first_char(line)]
		desired_outcome =outcome_map[last_char(line)]
		response = desired_outcome[move]
		return move => response
	end

	const default_guide = "inputs/rps-guide.txt"
	parse_guide(iter) = parse_strategum.(iter)

	get_guide(guide=default_guide) = parse_guide(eachline(guide))

	main(guide=get_guide()) = sum(score, guide)
	
end
