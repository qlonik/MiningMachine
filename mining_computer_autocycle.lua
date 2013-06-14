local rsInputSide = "left"

print("Running..")

while true do
	if redstone.getInput(rsInputSide) == true then
		shell.run("cycle")
	end
	sleep(1)
end
