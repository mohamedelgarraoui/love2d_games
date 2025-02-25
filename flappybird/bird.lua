Bird = Class{}

local bird = love.graphics.newImage('bird.png')

function Bird:init()
    self.width = bird:getWidth()
    self.heigh = bird:getHeight()
    self.x = (VIRTUAL_WIDTH - self.width) / 2
    self.y = (VIRTUAL_HEIGH - self.heigh) / 2
    self.dy = 0
    self.gravity = 20
end

function Bird:update(dt)

    if map_keys['space'] == 1 then
        self.dy =  -5

    else
        self.dy = self.dy + (self.gravity * dt)
    end
    self.y = self.y + self.dy 
end

function Bird:draw()
    love.graphics.draw(bird, self.x, self.y)
end