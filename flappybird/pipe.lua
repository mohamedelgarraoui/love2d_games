Pipe = Class{}

local Ipipe = love.graphics.newImage('pipe.png')

function Pipe:init()
    self.width = Ipipe:getWidth()
    self.heigh = Ipipe:getHeight()
    self.x = VIRTUAL_WIDTH 
    self.y = math.random(VIRTUAL_HEIGH / 4, VIRTUAL_HEIGH - 20)
end

function Pipe:update(dt)
    self.x = self.x - 1
end

function Pipe:draw()
    love.graphics.draw(Ipipe, self.x, self.y)
end
