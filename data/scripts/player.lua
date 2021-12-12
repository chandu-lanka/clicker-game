player = {}

function player:load()
    player.x = 0
    player.y = 0
    player.sprite = {}
    player.sprite.img = love.graphics.newImage("data/sprites/mouse.png")
end

function player:update(dt)
    mouse_x, mouse_y = love.mouse.getPosition()
    
    player.x = mouse_x
    player.y = mouse_y
end

function player:draw()
    love.graphics.draw(player.sprite.img, player.x, player.y, nil, nil, nil, 16, 16)
end