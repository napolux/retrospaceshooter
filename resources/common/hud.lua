-- hud class
Class = require "libraries.hump.class"

Hud = Class { 
    
    init = function(self)
        self.score = "00000000"
        self.highScore = "00010000"
        self.screenWidth  = love.graphics.getWidth()
        self.screenHeight = love.graphics.getHeight()
    end; 

    update = function(self, dt)

    end;

    draw = function(self)
        love.graphics.setColor(255, 255, 255, 255)
        love.graphics.printf("SCORE\n" .. self.score, 20, 20, self.screenWidth - 20, "left")
        love.graphics.printf("HIGH SCORE\n" .. self.highScore, 0, 20, self.screenWidth - 20, "right")
    end;
}

return Hud