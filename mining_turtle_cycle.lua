local timeout = 45
 
function deploy()
  turtle.select(1)
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
  turtle.select(1)
end
 
function getMiner()
  turtle.select(1)
  turtle.dig()
end
 
deploy()
clearInv()
getMiner()
