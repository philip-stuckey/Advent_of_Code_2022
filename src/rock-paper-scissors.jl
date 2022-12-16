module rock_paper_scissors

@enum Shape Rock=1 Paper Scissors

shape_map = Dict{Char, Shape}(
	'A' => Rock,
	'B' => Paper,
	'C' => Scissors,
	'X' => Rock,
	'Y' => Paper,
	'Z' => Scissors
)

const first_char = first
const last_char = last

function parse_strategum(move_string)
	move     = shape_map[first_char(move_string)]
	response = shape_map[last_char(move_string)]
	return move => response
end

function parse_guide(iter)
	return parse_strategum.(iter)
end

score(s::Shape) = Int(shape)

get_guide(file="inputs/rps-guide.txt") = parse_guide(eachline(file))


end
