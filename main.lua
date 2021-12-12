require("data/scripts/player")
require("data/scripts/target")

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    love.mouse.setVisible(false)
    player:load()
    target:load()

    font = love.graphics.newFont("data/fonts/m5x7.ttf", 45)

    score = 0
    timer = 0

    game_state = 1
end

function love.update(dt)
    player:update(dt)
    target:update(dt)
end

function love.mousepressed(x, y, button)
    if button == 1 then
        if mouse_x > target.x and mouse_x < target.x + target.collider.width then
            if mouse_y > target.y and mouse_y < target.y + target.collider.height then
                score = score + 1
                target.x = math.random(target.collider.width, love.graphics.getWidth() - target.collider.width)
                target.y = math.random(target.collider.height, love.graphics.getHeight() - target.collider.height)
            end
        end
    end
end

function love.draw()
    if game_state == 1 then
        
    end
    
    love.graphics.setBackgroundColor(0.2,0.2,0.2,1)
    target:draw()
    love.graphics.setFont(font)
    love.graphics.print("Score: "..tostring(score), 0, 0)
    player:draw()
end