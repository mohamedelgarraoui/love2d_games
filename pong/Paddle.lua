Paddle = class{}

function Paddle:init(x, y, side)
    self.width = 5
    self.height = 30
    self.x = x - self.width / 2
    self.y = y - self.height / 2
    self.score = 0
    self.side = side

end


function Paddle:update(dt)
end

function Paddle:draw()
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end