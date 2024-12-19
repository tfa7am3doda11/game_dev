local settings = {}

function settings.load()
    -- Initialize settings if needed
end

function settings.update(dt)
    -- Add settings update logic here if needed
end

function settings.draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Settings Menu", ww/2 - 100, 100)
    love.graphics.print("Press Escape to return to menu", 10, 50)
end

return settings