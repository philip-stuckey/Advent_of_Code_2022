module supply_stacks

struct instruction
	ammount::Int
	origin::Int
	destination::Int	
end

function move(x::Int; from, to)
	append!(to, from[(end-x):end
end

function parse_input(iter)
	drawing_str, instructions_str = separate_drawing(iter)
end

function separate_instructions(iter)
	drawing = []
	instructions =[]
	for line in iter
		if startswith(line,"move")
			push!(instructions, line)
			break
		end
		push!(drawing, line)
	end
	vcat!(instructions, iter)
	return drawing, instructions
end

end
