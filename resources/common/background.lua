-- Background animation class
Class = require "libraries.hump.class"

Background = Class { 
    
    init = function(self, density)
        self.screenWidth  = love.graphics.getWidth()
        self.screenHeight = love.graphics.getHeight() 
        self.baseStarSize = 5
        
        self.speed = 100
        self.density = 600
        -- stars
        self.stars = {}
        -- This loop will set up all the stars with their position, size and alpha generated randomly.
        for i = 1, self.density do --number of stars
            self.stars[i] = {
                x = love.math.random() * self.screenWidth,
                y = love.math.random() * self.screenHeight,
                size = love.math.random(5),       
            }
        end
    end; 

    update = function(self, dt)
        for i = 1, #self.stars do
          -- Modify each star's position, but wrap them around the screen (with the % modulo/modulus, or remainder operator)
          self.stars[i].y = (self.stars[i].y + (self.speed * (1 / self.stars[i].size)) * dt) % self.screenHeight
        end
    end;

    draw = function(self)
        for i = 1, #self.stars do
            love.graphics.push()
            love.graphics.setColor(0, 255, 0, 255 / self.stars[i].size)
            -- We modify the drawn positions with the parallax.
            love.graphics.rectangle("fill", self.stars[i].x, self.stars[i].y, self.baseStarSize / self.stars[i].size, self.baseStarSize / self.stars[i].size)
            love.graphics.pop()
        end
    end;
}

return Background