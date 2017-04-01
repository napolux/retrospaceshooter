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
local enemy = require "resources.sprites.enemy"

-- Our hud!
local hud = require "resources.common.hud"

function game:init()
    bg.init(bg)
    ship.init(ship)
    hud.init(hud, ship)

    self.maxLevels = 20
    self.gameTimer    = Timer.new()
    self.enemiesTimer = Timer.new()
    
    -- enemies
    self.enemiesCanSpawn = false
    self.enemies  = {}

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
end

function game:enter(previous, endData)
    self.from = previous
    self.screenWidth  = love.graphics.getWidth()
    self.screenHeight = love.graphics.getHeight() 

    -- enemies!
    self.enemiesTimer:every(3, function() 
        if self.enemiesCanSpawn then
            enemy = Enemy()
            enemy.init(enemy)
            table.insert(self.enemies, enemy)
            debugMsg("Enemies table size: " .. table.getn(self.enemies))
        end
    end)
end

function game:update(dt)
    self.gameTimer:update(dt)
    self.enemiesTimer:update(dt)

    bg.update(bg, dt)
    hud.update(hud, ship)
    ship.update(ship, dt)

    -- updating enemies, if any
    for index, enemy in pairs(self.enemies) do 
        enemy.update(enemy, dt)

        -- cleaning up enemies
        if(enemy.pos.y > self.screenHeight) then
            table.remove(self.enemies, index)
        end
    end
end

function game:draw()
    bg.draw(bg)
    ship.draw(ship)
    hud.draw(hud)

    -- drawing enemies, if any
    for index, enemy in pairs(self.enemies) do 
        enemy.draw(enemy)
    end

    if self.showLevelIntro then
        hud.drawLevelIntro(hud, self.currentLevel.levelName)
        self.gameTimer:after(10, function() 
            self.showLevelIntro  = false 
            self.enemiesCanSpawn = true 
        end)
    end
end


-- Keyboard controls...
function game:keypressed(key)

end