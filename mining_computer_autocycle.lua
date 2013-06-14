local rsInputSide = "left"

while true do
	print("Running..")

	if redstone.getInput(rsInputSide) == true then
		shell.run("cycle")
	end
	sleep(1)
end
