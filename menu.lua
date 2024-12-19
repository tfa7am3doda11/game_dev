local menu = {}

local menuImages
local buttons
local gameLogo
local logoLoadError = nil

function menu.load()
    -- Load game logo with error handling
    local success, result = pcall(function()
        gameLogo = love.graphics.newImage("logo/name.png")
    end)
    
    if not success then
        logoLoadError = result
        print("Error loading logo:", result)
    end
    
    -- Load menu images
    menuImages = {
        unselected_play = love.graphics.newImage("buttons/unselected_play_B.png"),
        selected_play = love.graphics.newImage("buttons/selected_play_B.png"),
        unselected_settings = love.graphics.newImage("buttons/unselected_settings_B.png"),
        selected_settings = love.graphics.newImage("buttons/selected_settings_B.png"),
        unselected_quite = love.graphics.newImage("buttons/unselected_quite_B.png"),
        selected_quite = love.graphics.newImage("buttons/selected_quite_B.png")
    }
    
    local maw = menuImages.unselected_play:getWidth()
    
    -- Store menu button positions and dimensions
    buttons = {
        play = {x = ww/2 - maw/2, y = wh/2 - 100, width = menuImages.unselected_play:getWidth(), height = menuImages.unselected_play:getHeight(), isHovered = false},
        settings = {x = ww/2 - maw/2, y = wh/2, width = menuImages.unselected_settings:getWidth(), height = menuImages.unselected_settings:getHeight(), isHovered = false},
        quite = {x = ww/2 - maw/2, y = wh/2 + 100, width = menuImages.unselected_quite:getWidth(), height = menuImages.unselected_quite:getHeight(), isHovered = false}
    }
end

function menu.update(dt)
    local mx, my = love.mouse.getPosition()
    
    -- Reset all hover states
    for button, _ in pairs(buttons) do
        buttons[button].isHovered = false
    end
    
    -- Check for hover
    for button, pos in pairs(buttons) do
        if mx >= pos.x and mx <= pos.x + pos.width and
           my >= pos.y and my <= pos.y + pos.height then
            buttons[button].isHovered = true
        end
    end
end

function menu.draw()
    love.graphics.setColor(1, 1, 1)  -- Reset color to white
    
    -- Draw game logo at the top of the screen
    if gameLogo then
        local logoX = ww/2 - gameLogo:getWidth()/2
        local logoY = 50
        love.graphics.draw(gameLogo, logoX, logoY)
    elseif logoLoadError then
        -- Display error message if logo failed to load
        love.graphics.setColor(1, 0, 0)  -- Red color for error
        love.graphics.print("Logo load error: " .. tostring(logoLoadError), 10, 10)
        love.graphics.setColor(1, 1, 1)  -- Reset color
    end
    
    -- Draw buttons with selected/unselected states
    love.graphics.draw(buttons.play.isHovered and menuImages.selected_play or menuImages.unselected_play, 
                      buttons.play.x, buttons.play.y)
    love.graphics.draw(buttons.settings.isHovered and menuImages.selected_settings or menuImages.unselected_settings, 
                      buttons.settings.x, buttons.settings.y)
    love.graphics.draw(buttons.quite.isHovered and menuImages.selected_quite or menuImages.unselected_quite, 
                      buttons.quite.x, buttons.quite.y)
end

function menu.mousepressed(x, y, button)
    if button == 1 then
        for name, pos in pairs(buttons) do
            if x >= pos.x and x <= pos.x + pos.width and
               y >= pos.y and y <= pos.y + pos.height then
                if name == "play" then
                    sound.music:stop()
                    sound.select:play()
                    gameState = "game"
                elseif name == "settings" then
                    sound.music:pause()
                    sound.select:play()
                    sound.music:play()
                    gameState = "settings"
                elseif name == "quite" then
                    sound.music:pause()
                    sound.select:play()
                    love.event.quit()
                end
            end
        end
    end
end

return menu