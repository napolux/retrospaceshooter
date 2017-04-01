-- This is the menu state...
menu = {}
menu.name = "Menu"

-- GUI library
local suit  = require "libraries.suit"
-- Background animation
local bg    = require "resources.common.background"

locale = require "libraries.locale.locale"


function menu:init()
    bg.init(bg)
end

function menu:enter(previous, endData)
    self.from = previous
    self.screenWidth  = love.graphics.getWidth()
    self.screenHeight = love.graphics.getHeight() 
end

function menu:createGUI()
    suit.layout:reset((self.screenWidth / 2) - 250, self.screenHeight - 400, 20, 20)    
    -- put a button at the layout origin
    gotoGameState = suit.Button("START!", suit.layout:row(500, 50))

    if gotoGameState.hit then 
        Gamestate.switch(game)
    end 

    quitGame = suit.Button("QUIT", suit.layout:row(500, 50))

    if quitGame.hit then         
        love.event.quit()
    end 
end

function menu:update(dt)
    bg.update(bg, dt)
    self:createGUI()
end

function menu:draw()
    bg.draw(bg)

    -- our "logo", with huge font!
    font = love.graphics.newFont("resources/fonts/arcadefont.ttf", 100)
    love.graphics.setFont(font)
    love.graphics.setColor(255, 255, 255, 255)    
    love.graphics.printf(locale.getLocalized("hud.gameName"),  0, 150, self.screenWidth, "center")
    -- set font size back to normal
    font = love.graphics.newFont("resources/fonts/arcadefont.ttf", 30)
    love.graphics.setFont(font)

    suit.draw()
end