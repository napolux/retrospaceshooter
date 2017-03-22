-- This is the menu state...
menu = {}
menu.name = "Menu"

-- Timer
local Timer = require "libraries.hump.timer"
-- GUI library
local suit  = require "libraries.suit"
-- Background animation
local bg    = require "resources.common.background"

function menu:init()
    bg.init(bg, 500)
end

function menu:enter(previous, endData)
    self.from = previous
    self.screenWidth  = love.graphics.getWidth()
    self.screenHeight = love.graphics.getHeight() 
end

function menu:createGUI()
    suit.layout:reset((self.screenWidth / 2) - 250, self.screenHeight - 400, 20, 20)    
    -- put a button at the layout origin
    gotoGameState = suit.Button("Start!", suit.layout:row(500, 50))

    if gotoGameState.hit then 
        Gamestate.switch(game)
    end 

    quitGame = suit.Button("Quit", suit.layout:row(500, 50))

    if quitGame.hit then         
        love.event.quit()
    end 
end

function menu:update(dt)
    Timer.update(dt)
    bg.update(bg, dt)
    self:createGUI()
end

function menu:draw()
    bg.draw(bg)
    suit.draw()
end