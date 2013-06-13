local direction = "forward"
local steps = 1
local rsBundleSide = "back"
local tArgs = {...}
 
movement = {
  ["left"]    = {color = colors.white},
  ["right"]   = {color = colors.black},
  ["forward"] = {color = colors.red},
  ["back"]    = {color = colors.green}
}
 
function printUsage()
  print("Usage: "..fs.getName(shell.getRunningProgram()).." <direction> [steps]")
  return
end
 
function pulse(direction)
  redstone.setBundledOutput(rsBundleSide, movement[direction].color)
  sleep(0.4)
  redstone.setBundledOutput(rsBundleSide, 0)
  sleep(0.4)
end
 
if #tArgs == 1 or #tArgs == 2 then
  if movement[tArgs[1]] ~= nil then
    direction = tostring(tArgs[1])
  else
    printUsage()
    return
  end
  
  local tmp_steps = tonumber(tArgs[2])
  if tArgs[2] ~= nil and tmp_steps > 0 then
    steps = tmp_steps
  end
else
  printUsage()
  return
end
 
for i = 1, steps do
  pulse(direction)
  sleep(0.5)
end
