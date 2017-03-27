-- Bullet class
Bullet = require "libraries.hump.class"

Bullet = Class { 
    init = function(self, bullet_x, bullet_y)
        self.screenWidth  = love.graphics.getWidth()
        self.screenHeight = love.graphics.getHeight() 

        -- physics data
        self.friction = 5
        self.speed    = 3000      
        self.vel      = {x = 0, y = 0}
        
        -- starting position and size
        self.size = {w = 5, h = 20}
        self.pos  = {x = bullet_x, y = bullet_y}

        -- bullet data
        self.sprite = love.graphics.rectangle("fill", self.pos.x, self.pos.y, self.size.w, self.size.h)
    end; 

    update = function(self, dt)
        self.physics(self, dt)
        self.move(self, dt)
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
        love.graphics.draw(self.sprite, self.pos.x, self.pos.y)
        love.graphics.pop()
    end;

    move = function(self, dt)

    end;
}

return Bullet