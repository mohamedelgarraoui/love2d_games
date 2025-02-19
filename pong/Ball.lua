Ball = class{}


function Ball:init()
    self.r = 4
    self.x = VIRTUAL_WIDTH / 2 - self.r / 2
    self.y = VIRTUAL_HEIGH / 2 - self.r / 2
    self.dx = math.random(0, 1) == 0 and -1 or 1
    self.dy = math.random(-5, 5)
    self.speed = 40
    self.side = math.random(0, 1) == 0 and  'left' or 'right'
end

function Ball:update(dt)
    if (self.y - self.r <= 0 or self.y + self.r >= VIRTUAL_HEIGH) then
        self.dy = self.dy * -1
    end
    if (self.x + self.r >= VIRTUAL_WIDTH) then
        self.side = 'left'
        self:reset()
        P2.score = P2.score + 1
        gamestate = 'start'
    elseif (self.x - self.r <= 0) then
        self.side = 'right'
        self:reset()
        P1.score = P1.score + 1
        gamestate = 'start'
    end
    self.x = self.x + (self.dx * dt * self.speed)
    self.y = self.y + (self.dy * dt * self.speed)
end

function Ball:reset()
    self.x = VIRTUAL_WIDTH / 2 - self.r / 2
    self.y = VIRTUAL_HEIGH / 2 - self.r / 2
    self.dx = (self.side == 'left') and -1 or 1 
    self.dy = math.random(-5, 5)
end

function Ball:colision(player)
    if self.x + self.r >= player.x 
        and self.x - self.r <= player.x + player.width
        and self.y + self.r >= player.y 
        and self.y - self.r <= player.y + player.height then
            self.dx = -self.dx
        end
end

function Ball:draw()
    love.graphics.setColor(255, 0, 0, 255)
    love.graphics.circle('fill', self.x, self.y, self.r)
    love.graphics.setColor(255, 255, 255, 255)

end