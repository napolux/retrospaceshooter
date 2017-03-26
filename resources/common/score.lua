-- score class
Class = require "libraries.hump.class"

Score = Class { 
    
    init = function(self)
        self.value = "00000000"
        self.screenWidth  = love.graphics.getWidth()
        self.screenHeight = love.graphics.getHeight()
    end; 

    update = function(self, dt)

    end;

    draw = function(self)
        love.graphics.setColor(255, 255, 255, 255)
        love.graphics.printf(self.value, 0, 20, self.screenWidth - 20, "right")

        -- love.graphics.print(self.value, self.screenWidth - 320, 30)       
    end;
}

return Score