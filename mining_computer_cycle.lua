local direction = "forward"
local modemSide = "right"
 
if not rednet.isOpen(modemSide) then
  rednet.open(modemSide)
end
 
shell.run("mvFrame", direction)
 
-- send dig command to all turtles
for i = 3, 18 do
  rednet.send(i, "cycle")
end
 
local i = 0
while i ~= 16 do
  senderID, message, distance = rednet.receive()
  i = i + 1
end
