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

function love.load()
    Gamestate.registerEvents()

    -- go to menu state
    Gamestate.switch(menu)

    -- Random seed
    love.math.setRandomSeed(love.timer.getTime())
end

function love.update(dt)

end

function love.draw()
    showDebugInfo();
end
