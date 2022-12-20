module rucksack


parse_item(item) = item

function parse_rucksack(line)
	split = Int(length(line)/2)
	compartment1 = parse_item.(line[begin:split])
	compartment2 = parse_item.(line[split+1:end])
	return (compartment1, compartment2)
end

priority(i::Char) = (i >= 'a') ? i - 'a' + 1 : i - 'A' + 27

function duplicate_item((compartment1, compartment2))
	return only(intersect(compartment1, compartment2))
end

get_rucksacks(file="inputs/rucksacks.txt") = parse_rucksack.(eachline(file))

main(rucksacks=get_rucksacks()) = sum(priority, duplicate_item.(rucksacks))

using IterTools

find_badges(iter) = [only(intersect(a,b,c)) for (a,b,c) in partition(iter, 3)]

part2(rucksacks=eachline("inputs/rucksacks.txt")) = sum(priority, find_badges(rucksacks))

end
