local timeout = 30
local miningWellSpot = 1

function deploy()
	turtle.select(miningWellSpot)
	turtle.place()
end

function clearInv()
	local time = 0
	while (turtle.getItemCount(1) == 0) and (time < timeout) do
		sleep(1)
		time = time + 1
	end
	sleep(2)

	while turtle.getItemCount(1) > 0 do
		for i = 1, 16 do
			turtle.select(i)
			turtle.dropDown()
		end
		sleep(1)
	end

	turtle.select(miningWellSpot)
end

function getMiner()
	for i = 1, 16 do 
		turtle.select(i)
		turtle.dropDown()
	end
	turtle.select(miningWellSpot)
	turtle.dig()
end

deploy()
clearInv()
getMiner()
