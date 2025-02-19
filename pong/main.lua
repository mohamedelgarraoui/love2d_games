
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
    smallfont = love.graphics.newFont('font.ttf', 8)
    bigfont = love.graphics.newFont('font.ttf', 16)

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGH, WINDOW_WIDTH, WINDOW_HEIGH, {
        fullscreen = false,
        vsync = true,
        resizable = true,
    })
    math.random(math.randomseed(os.time()))
    gamestate = 'start'
    endscore = 1
    P1 = Paddle('left')
    P2 = Paddle('right')
    B1 = Ball()

end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
    if key == 'space' then
        if gamestate == 'start' then
            gamestate = 'play'
        elseif gamestate == 'play' then
            gamestate = 'start'
        elseif gamestate == 'endgame' then
            gamestate = 'start'
            P1:reset()
            P2:reset()
            B1:reset()
        end
    end
end

function love.update(dt)
    if P1.score == endscore or P2.score == endscore then
        gamestate = 'endgame'
    end
    if gamestate == 'play' then 
        if love.keyboard.isDown('q') then
            P1.dy = -30
            elseif love.keyboard.isDown('a') then
                P1.dy = 30
            else
                P1.dy = 0
        end
        if love.keyboard.isDown('up') then
            P2.dy = -30
            elseif love.keyboard.isDown('down') then
                P2.dy = 30
            else
                P2.dy = 0
        end
        
        P1:update(dt)
        P2:update(dt)
        B1:colision(P1)
        B1:colision(P2)
        B1:update(dt)
    end

end

function love.draw()
    push:apply('start')
        love.graphics.clear(192, 1992, 192, 0.5)
        print(gamestate)
        showfps()
        love.graphics.rectangle('fill', VIRTUAL_WIDTH / 2 - 3, 0, 2, VIRTUAL_HEIGH)
        if gamestate ~= 'endgame' then
            -- love.graphics.rectangle('line', 10, 10, VIRTUAL_WIDTH - 20, VIRTUAL_HEIGH - 20)
            P1:draw()
            B1:draw()
            P2:draw()
            -- print ('score1: ' ..tostring(P1.score))
            -- print ('score2: ' ..tostring(P2.score))
        else 
            printwinner()
        end


    push:apply('end')
end

function showfps()
    love.graphics.setColor(0, 255, 0, 255)
    love.graphics.setFont(smallfont)
    love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()) , 10, 10)
    love.graphics.setColor(255, 255, 255, 255)

end

function printwinner()
    winner = (P1.score >= endscore) and 'P2' or 'P1'
    love.graphics.setFont(bigfont)
    love.graphics.printf('The Winner of the game is ' .. winner, 0, VIRTUAL_HEIGH / 2 - 32, VIRTUAL_WIDTH, 'center')
    love.graphics.printf('Press space for a new game', 0, VIRTUAL_HEIGH/2 , VIRTUAL_WIDTH, 'center')

end