module rock_paper_scissors

using StaticArrays
using LinearAlgebra

const Rock,Paper,Scissors = eachcol(SMatrix{3,3}(I))

shape_map = Dict(
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

parse_guide(iter) = parse_strategum.(iter)

winner = SMatrix{3,3}(
[
	 0 -1  1;
	 1  0 -1;
	-1  1  0
])

outcome = winner .* 3 .+ 3

score_matrix = SMatrix{3,3}(
[
	1 1 1;
	2 2 2;
	3 3 3 
])

score((enemy_move,your_move)) = your_move'*(outcome + score_matrix)*enemy_move #'

get_guide(file="inputs/rps-guide.txt") = parse_guide(eachline(file))

score_guide(guide=get_guide()) = sum(score, guide)

end
