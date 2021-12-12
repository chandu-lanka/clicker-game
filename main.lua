require("data/scripts/player")
require("data/scripts/target")

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    love.mouse.setVisible(false)
    player:load()
    target:load()

    font = love.graphics.newFont("data/fonts/m5x7.ttf", 45)
    title_font = love.graphics.newFont("data/fonts/m5x7.ttf", 100)

    score = 0
    timer = 0

    game_state = 1
end

function love.update(dt)
    player:update(dt)
    target:update(dt)
end

function love.mousepressed(x, y, button)
    if game_state == 1 then
        if button == 1 then
            game_state = 2
        end
    elseif game_state == 2 then
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
end

function love.draw()
    if game_state == 1 then
        love.graphics.setFont(title_font)
        love.graphics.print("Clicker Game", 200, 100)
        love.graphics.setFont(font)
        love.graphics.print("Click Anywhere To Play", 230, 300)

    elseif game_state == 2 then
        love.graphics.setBackgroundColor(0.2,0.2,0.2,1)
        target:draw()
        love.graphics.setFont(font)
        love.graphics.print("Score: "..tostring(score), 0, 0)
    end

    player:draw()
end