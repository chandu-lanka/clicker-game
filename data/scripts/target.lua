target = {}
hovered = false

function target:load()
    target.x = 100
    target.y = 100

    target.sprite = {}
    target.sprite.img = love.graphics.newImage("data/sprites/target.png")

    target.collider = {}
    target.collider.width = 48
    target.collider.height = 48
end

function target:update(dt)
    if mouse_x > target.x and mouse_x < target.x + target.collider.width then
        if mouse_y > target.y and mouse_y < target.y + target.collider.height then
            hovered = true
            return hovered
        end
    else
        hovered = false
    end
end

function target:draw()
    if hovered == true then
        target.sprite.img = love.graphics.newImage("data/sprites/target_hover.png")
    else
        target.sprite.img = love.graphics.newImage("data/sprites/target.png")
    end

    love.graphics.draw(target.sprite.img, target.x, target.y)
    love.graphics.rectangle("line", target.x, target.y, target.collider.width, target.collider.height)
end