local modemSide = "right"
if not rednet.isOpen(modemSide) then
  rednet.open(modemSide)
end
print("Port opened")
print("Waiting for incoming messages..")

while true do
  senderID, message, distance = rednet.receive()
  io.write(message.." .. ")
  if shell.run(message) then
    print("done")
  else
    print("error")
  end
  
  rednet.send(senderID, "finished")
end
