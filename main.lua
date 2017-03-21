-- This is the main game file

-- Base include file...
require "includes.common"  
require "includes.debug"

-- require locale
locale = require "libraries.locale.locale"

locale.setLocalization(COMMON.LOCALE)

function love.load()
    -- Screen size, we got it once, and use it a lot :-)
    COMMON.SCREEN_W     = love.graphics.getWidth()
    COMMON.SCREEN_H     = love.graphics.getHeight()

    -- Random seed
    love.math.setRandomSeed(love.timer.getTime())
end

function love.update(dt)

end

function love.draw()
    showDebugInfo();
end
