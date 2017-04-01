-- Bullet class
Bullet = require "libraries.hump.class"

Bullet = Class { 
    init = function(self, bullet_x, bullet_y)
        self.screenWidth  = love.graphics.getWidth()
        self.screenHeight = love.graphics.getHeight() 

        -- shoot sound
        self.sound        = love.audio.newSource("resources/sounds/shoot.wav", "static")
        self.sound:setVolume(0.5)
        self.sound:play()

        -- physics data
        self.friction = 0
        self.speed    = 500      
        self.vel      = {x = 0, y = -self.speed}
        
        -- starting position and size
        self.size = {w = 5, h = 30}
        self.pos  = {x = bullet_x, y = bullet_y}

    end; 

    update = function(self, dt)
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
        love.graphics.setColor(255,255,255,255);
        love.graphics.rectangle("fill", self.pos.x, self.pos.y, self.size.w, self.size.h)
        love.graphics.pop()
    end;
}

return Bullet