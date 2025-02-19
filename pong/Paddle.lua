Paddle = class{}

function Paddle:init(side)
    self.width = 5
    self.height = 30
    self.y = VIRTUAL_HEIGH / 2 - self.height / 2
    self.score = 0
    self.side = side
    self.x = (side == 'left') and 30 - self.width / 2 or VIRTUAL_WIDTH - 30
    self.dy = 0
    self.speed = 10
    self.pside = (self.side == 'right') and 40 or VIRTUAL_WIDTH - 70

end


function Paddle:update(dt)
    if (self.dy < 0) then
        self.y = math.max (self.y + (dt * self.dy), 0)
    else
        self.y = math.min (self.y + (dt * self.dy), VIRTUAL_HEIGH - self.height)
    end
end

function Paddle:draw()
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
    love.graphics.setFont(bigfont)
    love.graphics.print('Score: ' .. self.score, self.pside, 50)
end

function Paddle:reset()
    self.score = 0
end