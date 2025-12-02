-- Utility functions
local Utils = {}

-- Clamp a value between min and max
function Utils.clamp(value, min, max)
    return math.max(min, math.min(max, value))
end

-- Linear interpolation
function Utils.lerp(a, b, t)
    return a + (b - a) * t
end

-- Calculate distance between two points
function Utils.distance(x1, y1, x2, y2)
    local dx = x2 - x1
    local dy = y2 - y1
    return math.sqrt(dx * dx + dy * dy)
end

-- Normalize a vector
function Utils.normalize(x, y)
    local len = math.sqrt(x * x + y * y)
    if len > 0 then
        return x / len, y / len
    end
    return 0, 0
end

-- Random number in range
function Utils.randomRange(min, max)
    return min + math.random() * (max - min)
end

-- Check if point is inside rectangle
function Utils.pointInRect(px, py, rx, ry, rw, rh)
    return px >= rx and px <= rx + rw and
           py >= ry and py <= ry + rh
end

return Utils
