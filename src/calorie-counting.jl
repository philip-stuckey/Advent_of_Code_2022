module calorie_counting
function parse_calories(iter)
	elves=Int[]
	calories=0
	for line in iter
		if isempty(line)
			push!(elves, calories)
			calories=0
		else
			calories += parse(Int, line)
		end
	end
	push!(elves, calories)
	return elves
end

elf_calories(file="inputs/elf-calories.txt") = parse_calories(eachline(file))
main(calories=elf_calories())= findmax(calories)

function findmaxN(iter; n=3)
	min = typemin(eltype(iter))
	maxes=fill(min, n)
	for item in iter
		for (i, max) in enumerate(maxes)
			if item>max
				maxes[i] = item
				break
			end
		end
	end
	return maxes
end

main2_0(calories=elf_calories())= sum(sort(calories)[end-2:end])
main2_1(calories=elf_calories()) = sum(findmaxN(calories, n=3))

main2(calories=elf_calories()) = main2_1(calories)

end
