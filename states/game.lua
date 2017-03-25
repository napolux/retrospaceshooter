-- This is the game state...
game = {}
game.name = "Game"

-- Timer
local Timer = require "libraries.hump.timer"

-- Background animation
local bg    = require "resources.common.background"

function game:init()
    bg.init(bg)
end

function game:enter(previous, endData)
    self.from = previous
    self.screenWidth  = love.graphics.getWidth()
    self.screenHeight = love.graphics.getHeight() 
end

function game:update(dt)
    Timer.update(dt)
    bg.update(bg, dt)
end

function game:draw()
    bg.draw(bg)
end