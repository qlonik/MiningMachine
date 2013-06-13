local direction = "forward"
local modemSide = "right"
local tArgs = {...}
local steps = 1

function printUsage()
  print("Usage: "..fs.getName(shell.getRunningProgram()).." [steps]")
  return
end

if #tArgs > 1 then
  printUsage()
else
  local tmp_steps = tonumber(tArgs[1])
  if (tArgs[1] ~= nil) and (tmp_steps > 1) then
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
  for i = 3, 18 do
    rednet.send(i, "cycle")
  end

  local i = 0
  while i ~= 16 do
    senderID, message, distance = rednet.receive()
    i = i + 1
  end
  
  shell.run("mvFrame", direction)
  
  print(" .. done")
end
