-- Run this if finished cycle program unexpectedly
-- Be careful about sending Mining Well into 
-- inventory below

for i = 1, 16 do
	turtle.select(i)
	turtle.dropDown()
end

turtle.select(1)
turtle.dig()
