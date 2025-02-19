
WINDOW_WIDTH = 1280
WINDOW_HEIGH = 720
VIRTUAL_WIDTH = 432
VIRTUAL_HEIGH = 243

class = require 'class'
push = require 'push'
require 'Paddle'
require 'Ball'


function love.load()
    love.window.setTitle('Pong')
    love.graphics.setDefaultFilter('nearest', 'nearest')
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGH, WINDOW_WIDTH, WINDOW_HEIGH, {
        fullscreen = false,
        vsync = true,
        resizable = true,
    })
    P1 = Paddle(30, VIRTUAL_HEIGH/2 ,'left')
    P2 = Paddle(VIRTUAL_WIDTH - 25, VIRTUAL_HEIGH/2, 'right')
    B1 = Ball(VIRTUAL_WIDTH / 2, VIRTUAL_HEIGH / 2)

end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end

function love.update(dt)
end

function love.draw()
    push:apply('start')
        love.graphics.clear(192, 1992, 192, 0.5)
        love.graphics.rectangle('fill', VIRTUAL_WIDTH / 2 - 3, 0, 2, VIRTUAL_HEIGH)
        -- love.graphics.rectangle('line', 10, 10, VIRTUAL_WIDTH - 20, VIRTUAL_HEIGH - 20)
        P1:draw()
        B1:draw()
        P2:draw()
    push:apply('end')
end