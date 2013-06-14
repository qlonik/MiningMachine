direction = "forward"
steps = 1
rsBundleSide = "back"
tArgs = {...} 

movement = {
	["left"]    = {color = colors.white},
	["right"]   = {color = colors.black},
	["forward"] = {color = colors.red},
	["back"]    = {color = colors.green}
}

function pulse(direction)
	redstone.setBundledOutput(rsBundleSide, movement[direction].color)
	sleep(0.4)
	redstone.setBundledOutput(rsBundleSide, 0)
	sleep(0.4)
end

function printUsage()
	print("Usage: "..fs.getName(shell.getRunningProgram()).." <direction> [steps]")
	return
end

if #tArgs == 1 or #tArgs == 2 then
	local tmp_direction = tostring(tArgs[1])
	local tmp_steps = tonumber(tArgs[2])

	if movement[tmp_direction] ~= nil then
		direction = tmp_direction
	else
		printUsage()
	end

	if type(tmp_steps) == "number" and tmp_steps > 0 then
		steps = tmp_steps
	end
else
	printUsage()
end

for i = 1, steps do
	pulse(direction)
	sleep(1)
end
