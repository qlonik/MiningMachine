local direction = "forward"
local modemSide = "right"
local steps = 1

local turtles = 16
local firstTurtle = 3
local tArgs = {...}

function printUsage()
	print("Usage: "..fs.getName(shell.getRunningProgram()).." [steps]")
	return
end

if #tArgs > 1 then
	printUsage()
else
	local tmp_steps = tonumber(tArgs[1])

	if (tmp_steps ~= nil) and (tmp_steps > 1) then
		steps = tmp_steps
	end
end

if not rednet.isOpen(modemSide) then
	rednet.open(modemSide)
end

for i = 1, steps do
	if steps > 1 then
		io.write("Step #"..i.." out of "..steps)
	end

	-- send dig command to all turtles
	for j = firstTurtle, (firstTurtle + turtles - 1) do
		rednet.send(j, "cycle")
	end

	-- wait for answer from all turtles
	local j = 0
	while j < turtles do
		senderID, message, distance = rednet.receive()
		j = j + 1
	end

	shell.run("mvFrame", direction)

	print(" .. done")
end
