Pipepair = Class{}

local GAP_HEIGHT = 90

function Pipepair:init(y)
    self.x = VIRTUAL_WIDTH + 32
    self.y = y
    self.pipes = {
        ['upper'] = Pipe('top', self.y),
        ['lower'] = Pipe('bot', self.y + PIPE_HEIGHT + GAP_HEIGHT)
    }
    self.remove = false
end

function Pipepair:update(dt)
    if self.x > -PIPE_WIDTH then
        self.x = self.x - PIPE_SPEED * dt
        self.pipes['lower'].x = self.x
        self.pipes['upper'].x = self.x
    else
        self.remove = true
    end
end

function Pipepair:draw()
    for k, pipe in pairs(self.pipes) do
        pipe:draw()
    end

end