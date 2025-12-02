-- LÖVE2D Main Game File
-- A simple bouncing ball game with player paddle

-- Game state
local player = {
    x = 350,
    y = 550,
    width = 100,
    height = 20,
    speed = 400,
    color = {0.2, 0.6, 1.0}
}

local ball = {
    x = 400,
    y = 300,
    radius = 10,
    dx = 200,
    dy = -200,
    color = {1.0, 0.4, 0.4}
}

local score = 0
local gameOver = false

-- Called once at the start
function love.load()
    love.window.setTitle("CodeSmoker LÖVE2D Test - Score: 0")
    love.graphics.setBackgroundColor(0.1, 0.1, 0.15)
    
    -- Set random seed
    math.randomseed(os.time())
    
    -- Initialize font
    font = love.graphics.newFont(24)
    smallFont = love.graphics.newFont(16)
end

-- Called every frame to update game logic
function love.update(dt)
    if gameOver then
        return
    end
    
    -- Player movement
    if love.keyboard.isDown("left") or love.keyboard.isDown("a") then
        player.x = player.x - player.speed * dt
    end
    if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
        player.x = player.x + player.speed * dt
    end
    
    -- Keep player in bounds
    local windowWidth = love.graphics.getWidth()
    if player.x < 0 then
        player.x = 0
    elseif player.x + player.width > windowWidth then
        player.x = windowWidth - player.width
    end
    
    -- Ball movement
    ball.x = ball.x + ball.dx * dt
    ball.y = ball.y + ball.dy * dt
    
    -- Ball collision with walls
    local windowHeight = love.graphics.getHeight()
    
    -- Left and right walls
    if ball.x - ball.radius < 0 then
        ball.x = ball.radius
        ball.dx = -ball.dx
    elseif ball.x + ball.radius > windowWidth then
        ball.x = windowWidth - ball.radius
        ball.dx = -ball.dx
    end
    
    -- Top wall
    if ball.y - ball.radius < 0 then
        ball.y = ball.radius
        ball.dy = -ball.dy
    end
    
    -- Bottom (game over)
    if ball.y + ball.radius > windowHeight then
        gameOver = true
    end
    
    -- Ball collision with paddle
    if ball.dy > 0 and
       ball.y + ball.radius > player.y and
       ball.y - ball.radius < player.y + player.height and
       ball.x > player.x and
       ball.x < player.x + player.width then
        ball.dy = -ball.dy
        ball.y = player.y - ball.radius
        score = score + 1
        love.window.setTitle("CodeSmoker LÖVE2D Test - Score: " .. score)
        
        -- Increase speed slightly
        ball.dx = ball.dx * 1.05
        ball.dy = ball.dy * 1.05
    end
end

-- Called every frame to draw
function love.draw()
    -- Draw player paddle
    love.graphics.setColor(player.color)
    love.graphics.rectangle("fill", player.x, player.y, player.width, player.height, 5, 5)
    
    -- Draw ball
    love.graphics.setColor(ball.color)
    love.graphics.circle("fill", ball.x, ball.y, ball.radius)
    
    -- Draw score
    love.graphics.setColor(1, 1, 1)
    love.graphics.setFont(font)
    love.graphics.print("Score: " .. score, 10, 10)
    
    -- Draw instructions
    love.graphics.setFont(smallFont)
    love.graphics.setColor(0.7, 0.7, 0.7)
    love.graphics.print("Use LEFT/RIGHT arrows or A/D to move", 10, 45)
    
    -- Game over screen
    if gameOver then
        love.graphics.setColor(0, 0, 0, 0.7)
        love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
        
        love.graphics.setColor(1, 0.3, 0.3)
        love.graphics.setFont(font)
        local text = "Game Over! Score: " .. score
        local textWidth = font:getWidth(text)
        love.graphics.print(text, (love.graphics.getWidth() - textWidth) / 2, 250)
        
        love.graphics.setColor(1, 1, 1)
        love.graphics.setFont(smallFont)
        local restartText = "Press SPACE to restart or ESC to quit"
        local restartWidth = smallFont:getWidth(restartText)
        love.graphics.print(restartText, (love.graphics.getWidth() - restartWidth) / 2, 300)
    end
end

-- Handle key presses
function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    elseif key == "space" and gameOver then
        -- Reset game
        ball.x = 400
        ball.y = 300
        ball.dx = 200 * (math.random() > 0.5 and 1 or -1)
        ball.dy = -200
        player.x = 350
        score = 0
        gameOver = false
        love.window.setTitle("CodeSmoker LÖVE2D Test - Score: 0")
    end
end

-- Handle window resize
function love.resize(w, h)
    -- Keep player paddle at bottom
    player.y = h - 50
end
