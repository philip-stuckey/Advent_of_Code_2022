module camp_cleanup

function parse_job(line)
	a,b,c,d = parse.(Int, split(line, occursin("-,")))
	return a:b, c:d
end

fully_contained((job1, job2)) = issubset(job1, job2) || issubset(job2, job1)

const job_file = "inputs/jobs.txt"

get_jobs(file=job_file) = parse_job.(eachline(file))
part1(jobs=get_jobs()) = count(fully_contained, jobs)

overlap((job1, job2)) = !isempty(intersect(job1, job2))

part2(jobs=get_jobs()) = count(overlap, jobs)

end
