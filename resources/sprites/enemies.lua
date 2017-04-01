-- Enemies class
Enemies = require "libraries.hump.class"
local Timer  = require "libraries.hump.timer"

Enemies = Class { 
    init = function(self)
        self.screenWidth  = love.graphics.getWidth()
        self.screenHeight = love.graphics.getHeight() 

        -- physics data
        self.friction = 5
        self.speed    = 3000      
        self.vel      = {x = 0, y = 0}

        -- starting position and size
        self.size = {w = 40, h = 60}
        self.pos  = {x = (self.screenWidth / 2) - (self.size.w / 2), y = self.screenHeight - self.size.h - 50}
    end; 

    update = function(self, dt)
        Timer.update(dt)
        self.physics(self, dt)
        self.move(self, dt)

        -- updating bullets, if any
        for index, bullet in pairs(self.bullets) do 
            debugMsg("Bullet table size: " .. table.getn(self.bullets))
        end
    end;

    physics = function(self, dt) 
        self.pos.x = self.pos.x + (self.vel.x * dt)
        self.pos.y = self.pos.y + (self.vel.y * dt)
        self.vel.x = self.vel.x * (1 - math.min(dt * self.friction, 1))
        self.vel.y = self.vel.y * (1 - math.min(dt * self.friction, 1))
    end;

    draw = function(self)
        love.graphics.push()

        love.graphics.pop()
    end;
  
}

return Bullet