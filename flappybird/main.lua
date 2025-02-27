Class = require 'class'
push = require 'push'
require 'bird'
require 'pipe'
require 'pipepair'

WINDOW_WIDTH = 1280
WINDOW_HEIGH = 720
VIRTUAL_WIDTH = 512
VIRTUAL_HEIGH = 288

local background = love.graphics.newImage('background.png')
local ground = love.graphics.newImage('ground.png')

local B1 = Bird()
-- local pipes = {}
local pipe_pairs = {}
local spawn_time = 0
local lastY = -PIPE_HEIGHT + math.random(80) + 20

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    love.window.setTitle('FlappyBird')
    math.randomseed(os.time())
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
    map_keys = {}
 
end


function love.resize(w, h)
    push:resize(w, h)
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
    map_keys[key] = 1
end

function love.update(dt)
    background_scroll = (background_scroll + background_scroll_speed * dt ) 
    % background_loping_point

    ground_scroll = (ground_scroll + ground_scroll_speed * dt) 
        % VIRTUAL_WIDTH

    B1:update(dt)
    spawn_time = spawn_time + dt
    if spawn_time > 2 then
        local y = math.max(-PIPE_HEIGHT + 10,
            math.min(lastY + math.random(-20, 20), VIRTUAL_HEIGH - 90 - PIPE_HEIGHT))
        lastY = y
        table.insert(pipe_pairs, Pipepair(y))
        spawn_time = 0
    end
    for k, keys in pairs(pipe_pairs) do
        keys:update(dt)
    end

    for k, keys in pairs(pipe_pairs) do
        if keys.remove then
            table.remove(pipe_pairs, k)
        end
    end

    map_keys = {}
end

function love.draw()
    push:apply('start')
        love.graphics.draw(background, -background_scroll, 0)
        for k, keys in pairs(pipe_pairs) do
            keys:draw()
        end
        love.graphics.draw(ground, -ground_scroll, VIRTUAL_HEIGH - 15)
        B1:draw()
    push:apply('end')


end