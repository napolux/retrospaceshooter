-- hud class
-- TODO: draw lives!!!
Class  = require "libraries.hump.class"
locale = require "libraries.locale.locale"

Hud = Class { 
    
    init = function(self, ship)
        self.score = "00000000"
        self.highScore = "00010000"
        self.lives = ship.lives
        self.screenWidth  = love.graphics.getWidth()
        self.screenHeight = love.graphics.getHeight()
    end; 

    update = function(self, ship)
        self.lives = ship.lives
    end;

    draw = function(self)
        love.graphics.setColor(255, 255, 255, 255)
        love.graphics.printf(locale.getLocalized("hud.score")   .. "\n" .. self.score,     20, 20, self.screenWidth - 20, "left")
        love.graphics.printf(locale.getLocalized("hud.hiscore") .. "\n" .. self.highScore,  0, 20, self.screenWidth - 20, "right")
    end;
}

return Hud