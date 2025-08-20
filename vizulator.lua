-- vizulator
--
-- just a thing to keep
-- the screen busy
-- while making new things


--------------------------
--------------------------
-- screen controls  ------
--------------------------
width = 128
height = 64


posY = 1
i = 0
freq = 0.0025
amp = 2.75
offSet = 10
mult = 54.89
brite = 16



function drawVoice(v)
  i = i + (freq * (v*3))
  for x = 1, width do
    posY = math.sin(x * mult/v + i)*height/(amp*math.sin(0.1 * 0.3 + i/v))+(height/2)+ offSet + (math.sin(v * mult + i)*10)
    
    screen.move(x,1)
    screen.line_width(1)
    screen.line(x,posY)
    screen.level(math.floor(brite))
    screen.stroke() 
  end
end

-- use this metro for clocked framerate
m1 = metro.init()
m1.time = 1/12
m1.event = function()
  redraw()
end
m1:start()

--[[ for full framerate, uncomment this function
function refresh()
  
  redraw()
  
end
]]
-------------------------------------
-------------------------------------
-------------------------------------


function redraw()
  screen.clear()
  drawVoice(5) -- this is the function that calls the drawing code
  screen.update()
end
