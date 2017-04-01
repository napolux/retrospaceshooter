-- This is the game state...
game = {}
game.name = "Game"

-- Timer
local Timer = require "libraries.hump.timer"

-- Background animation
local bg    = require "resources.common.background"

-- Our player
local ship  = require "resources.sprites.ship"

-- Enemies
local enemies = require "resources.sprites.enemies"

-- Our hud!
local hud = require "resources.common.hud"

function game:init()
    bg.init(bg)
    ship.init(ship)
    hud.init(hud, ship)

    self.maxLevels    = 20
    self.enemiesSpawn = false

    -- levels 
    self.levels = {}

    for i = 1, self.maxLevels do
        self.levels[i] = {
            levelName = i,
            levelSize = 25 * i    
        }
    end

    self.showLevelIntro = true

    -- current level
    self.currentLevel = self.levels[1]

    enemies.init(enemies, self.currentLevel)
end

function game:enter(previous, endData)
    self.from = previous
    self.screenWidth  = love.graphics.getWidth()
    self.screenHeight = love.graphics.getHeight() 
end

function game:update(dt)
    Timer.update(dt)
    bg.update(bg, dt)
    hud.update(hud, ship)
    ship.update(ship, dt)
end

function game:draw()
    bg.draw(bg)
    ship.draw(ship)
    hud.draw(hud)

    if self.showLevelIntro then
        hud.drawLevelIntro(hud, self.currentLevel.levelName)
        Timer.after(10, function() 
            self.showLevelIntro = false 
            self.enemiesSpawn   = true 
        end)
    end
end


-- Keyboard controls...
function game:keypressed(key)

end