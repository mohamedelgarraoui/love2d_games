class = require 'class'
push = require 'push'

WINDOW_WIDTH = 1280
WINDOW_HEIGH = 720
VIRTUAL_WIDTH = 512
VIRTUAL_HEIGH = 288

local background = love.graphics.newImage('background.png')
local ground = love.graphics.newImage('ground.png')

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    love.window.setTitle('FlappyBird')
    smallfont = love.graphics.newFont('font.ttf', 8)
    bigfont   = love.graphics.newFont('font.ttf', 32)
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGH, WINDOW_WIDTH, WINDOW_HEIGH ,{
        fullscreen = false,
        vsynnc = true,
        resizable = true
    })
    background_scroll = 0
    background_scroll_speed  = 30
    ground_scroll = 0
    ground_scroll_speed = 60
    background_loping_point = 413


end


function love.resize(w, h)
    push:resize(w, h)
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end

function love.update(dt)
    background_scroll = (background_scroll + background_scroll_speed * dt) 
    % background_loping_point

    ground_scroll = (ground_scroll + ground_scroll_speed * dt) 
        % VIRTUAL_WIDTH
end

function love.draw()
    push:apply('start')
        love.graphics.draw(background, -background_scroll, 0)
        love.graphics.draw(ground, -ground_scroll, VIRTUAL_HEIGH - 15)
        
    push:apply('end')


end