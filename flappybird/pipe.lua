Pipe = Class{}

local Ipipe = love.graphics.newImage('pipe.png')

PIPE_SPEED = 60
PIPE_HEIGHT = 288
PIPE_WIDTH = 70

-- function Pipe:init()
--     self.width = Ipipe:getWidth()
--     self.heigh = Ipipe:getHeight()
--     self.x = VIRTUAL_WIDTH 
--     self.y = math.random(VIRTUAL_HEIGH / 4, VIRTUAL_HEIGH - 20)
-- end

-- function Pipe:update(dt)
--     self.x = self.x - 1
-- end

-- function Pipe:draw()
--     love.graphics.draw(Ipipe, self.x, self.y)
-- end

function Pipe:init(orioentation, y)
    self.x = VIRTUAL_WIDTH
    self.y = y

    self.width = Ipipe:getWidth()
    self.heigh = PIPE_HEIGHT
    self.orioentation = orioentation
end

function Pipe:update(dt)

end

function Pipe:draw()
    love.graphics.draw(Ipipe,self.x, 

    
    (self.orioentation == 'top' and self.y + PIPE_HEIGHT or self.y),
    0, 1, self.orioentation == 'top' and -1 or 1)
end