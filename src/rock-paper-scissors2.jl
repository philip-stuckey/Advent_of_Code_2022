module rock_paper_scissors2

@enum Shape Rock=1 Paper Scissors

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

function parse_strategum(move_string; shape_map=shape_map)
    move     = shape_map[first_char(move_string)]
    response = shape_map[last_char(move_string)]
    return move => response
end

parse_guide(iter) = parse_strategum.(iter)
get_guide(file="inputs/rps-guide.txt")=parse_guide(eachline(file))

shape_score(s::Shape)= Int(s)
shape_score(p::Pair{Shape, Shape})=shape_score(last(p))

winning_moves = Set([
	Rock=>Scissors,
	Paper=>Rock,
	Scissors=>Paper
])

const win_score = 6
const draw_score = 3
const loss_score = 0

function game_score((move, response))
	return if move == response
		draw_score
	elseif (move=>response) in winning_moves
		loss_score
	elseif (response=>move) in winning_moves
		win_score
	else
		error("wat")
	end
end

score((move, response)) = shape_score(response)+game_score(move=>response)

main(guide=get_guide())=sum(score, guide)

end
