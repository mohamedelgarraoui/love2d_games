Ball = class{}


function Ball:init(x, y)
    self.r = 4
    self.x = x - self.r / 2
    self.y = y - self.r / 2
end

function Ball:update(dt)
end

function Ball:draw()
    love.graphics.setColor(255, 0, 0, 255)
    love.graphics.circle('fill', self.x, self.y, self.r)
    love.graphics.setColor(255, 255, 255, 255)

end