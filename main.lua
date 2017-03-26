-- This is the main game file

-- Base include file...
require "includes.common"  
require "includes.debug"

-- require locale
locale = require "libraries.locale.locale"
-- require hump gamestate
Gamestate = require "libraries.hump.gamestate"

locale.setLocalization(COMMON.LOCALE)

-- requiring game states
require "states.menu"
require "states.game"

function love.load()
    -- registering events
    Gamestate.registerEvents()

    -- go to menu state
    Gamestate.switch(menu)

    -- random seed
    love.math.setRandomSeed(love.timer.getTime())

    -- keyboard repeat mode
    love.keyboard.setKeyRepeat(true)

    -- fonts
    font = love.graphics.newFont("resources/fonts/arcadefont.ttf", 30)
    love.graphics.setFont(font)

end

function love.update(dt)

end

function love.draw()
    showDebugInfo();
end
