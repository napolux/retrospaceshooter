-- This is the game state...
game = {}
game.name = "Game"

-- Timer
local Timer = require "libraries.hump.timer"

-- Background animation
local bg    = require "resources.common.background"

-- Our player
local ship  = require "resources.sprites.ship"

-- Our score!

local score = require "resources.common.score"

function game:init()
    bg.init(bg)
    ship.init(ship)
    score.init(score)
end

function game:enter(previous, endData)
    self.from = previous
    self.screenWidth  = love.graphics.getWidth()
    self.screenHeight = love.graphics.getHeight() 
end

function game:update(dt)
    Timer.update(dt)
    bg.update(bg, dt)
    ship.update(ship, dt)
    score.update(score)
end

function game:draw()
    bg.draw(bg)
    ship.draw(ship)
    score.draw(score)
end


-- Keyboard controls...
function game:keypressed(key)

end