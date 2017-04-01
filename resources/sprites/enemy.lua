-- Enemy class
Enemy = require "libraries.hump.class"
local Timer = require "libraries.hump.timer"

Enemy = Class { 
    init = function(self)
        self.screenWidth  = love.graphics.getWidth()
        self.screenHeight = love.graphics.getHeight() 

        -- physics data
        self.friction = 0
        self.speed    = love.math.random(100, 500)      
        self.vel      = {x = love.math.random(-200, 200), y = self.speed}

        -- starting position and size
        self.size = {w = 60, h = 60}
        self.pos  = {x = love.math.random(self.size.w, self.screenWidth - self.size.w), y = -50}
    end; 

    update = function(self, dt)
        Timer.update(dt)
        self.physics(self, dt)
    end;

    physics = function(self, dt) 
        self.pos.x = self.pos.x + (self.vel.x * dt)
        self.pos.y = self.pos.y + (self.vel.y * dt)
        self.vel.x = self.vel.x * (1 - math.min(dt * self.friction, 1))
        self.vel.y = self.vel.y * (1 - math.min(dt * self.friction, 1))
    end;

    draw = function(self)
        love.graphics.push()
        love.graphics.setColor(0,255,0,255);
        love.graphics.rectangle("fill", self.pos.x, self.pos.y, self.size.w, self.size.h)  
        love.graphics.pop()
    end;
  
}

return Enemy