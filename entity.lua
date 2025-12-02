-- Entity module for game objects
local Entity = {}
Entity.__index = Entity

function Entity.new(x, y, width, height)
    local self = setmetatable({}, Entity)
    self.x = x or 0
    self.y = y or 0
    self.width = width or 32
    self.height = height or 32
    self.dx = 0
    self.dy = 0
    self.color = {1, 1, 1}
    return self
end

function Entity:update(dt)
    self.x = self.x + self.dx * dt
    self.y = self.y + self.dy * dt
end

function Entity:draw()
    love.graphics.setColor(self.color)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function Entity:setVelocity(dx, dy)
    self.dx = dx
    self.dy = dy
end

function Entity:setColor(r, g, b)
    self.color = {r, g, b}
end

function Entity:getBounds()
    return {
        left = self.x,
        right = self.x + self.width,
        top = self.y,
        bottom = self.y + self.height
    }
end

function Entity:collidesWith(other)
    local a = self:getBounds()
    local b = other:getBounds()
    return a.left < b.right and
           a.right > b.left and
           a.top < b.bottom and
           a.bottom > b.top
end

return Entity
