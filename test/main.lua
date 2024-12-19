function love.load()
    game_name = love.graphics.newImage("name.png")
end

function love.update()
    
end

function love.draw()
    love.graphics.setBackgroundColor(0, 0, 1)
    love.graphics.draw(game_name, 0, 0)
end