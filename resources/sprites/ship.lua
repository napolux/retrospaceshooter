-- Ship class
Ship = require "libraries.hump.class"

Ship = Class { 
    init = function(self)
        self.screenWidth  = love.graphics.getWidth()
        self.screenHeight = love.graphics.getHeight() 

        
        -- physics data
        self.friction = 4
        self.speed    = 2000      
        self.vel      = {x = 0, y = 0}
        
        -- starting position and size
        self.size = {w = 60, h = 60}
        self.pos = {x = (self.screenWidth / 2) - (self.size.w / 2), y = self.screenHeight - self.size.h - 50}
        debugMsg("Ship init: " .. (self.screenWidth / 2) - (self.size.w / 2))
    end; 

    update = function(self, dt)
        self.physics(self, dt)
        self.move(self, dt)
    end;

    physics = function(self, dt) 
        self.pos.x   = self.pos.x + (self.vel.x * dt)
        self.pos.y   = self.pos.y + (self.vel.y * dt)
        self.vel.x = self.vel.x * (1 - math.min(dt * self.friction, 1))
        self.vel.y = self.vel.y * (1 - math.min(dt * self.friction, 1))
    end;

    draw = function(self)
        love.graphics.push()
        love.graphics.setColor(255, 255, 0, 255)
        love.graphics.rectangle("fill", self.pos.x, self.pos.y, self.size.w, self.size.h)
        love.graphics.pop()
    end;

    move = function(self, dt)
        if love.keyboard.isDown("right") and self.vel.x < self.speed then
            self.vel.x = self.vel.x + self.speed * dt
        end

        if love.keyboard.isDown("left") and self.vel.x > -self.speed then
            self.vel.x = self.vel.x - self.speed * dt
        end

        if love.keyboard.isDown("down") and self.vel.y < self.speed then
            self.vel.y = self.vel.y + self.speed * dt
        end

        if love.keyboard.isDown("up") and self.vel.y > -self.speed then
            self.vel.y = self.vel.y - self.speed * dt
        end

        -- managing screen corners
        self.manageCorners(self)
    end;

    manageCorners = function(self) 
        if self.pos.x < 0 then
            self.pos.x = 0
            self.vel.x = 0
        end
        if self.pos.y < 0 then
            self.pos.y = 0
            self.vel.y = 0
        end

        if(self.pos.x + self.size.w > self.screenWidth) then 
            self.pos.x = self.screenWidth - self.size.w
            self.vel.x = 0
        end 

        if(self.pos.y + self.size.h > self.screenHeight) then 
            self.pos.y = self.screenHeight - self.size.h
            self.vel.y = 0
        end 
    end;
}

return Ship