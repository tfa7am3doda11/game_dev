-- modeselect.lua  -- Changed from gamemode.lua
local modeselect = {}  -- Changed from gamemode

local modeImages
local buttons

function modeselect.load()
    -- Load mode selection images
    modeImages = {
        vs_computer = love.graphics.newImage("logo/pc.png"),
        vs_player = love.graphics.newImage("logo/man.png")
    }
    
    -- Calculate button positions
    local buttonWidth = modeImages.vs_computer:getWidth()
    local buttonHeight = modeImages.vs_computer:getHeight()
    
    -- Store button positions and dimensions
    buttons = {
        vs_computer = {
            x = ww/2 - buttonWidth/2,
            y = wh/2 - buttonHeight - 20,
            width = buttonWidth,
            height = buttonHeight,
            isHovered = false
        },
        vs_player = {
            x = ww/2 - buttonWidth/2,
            y = wh/2 + 20,
            width = buttonWidth,
            height = buttonHeight,
            isHovered = false
        }
    }
end

function modeselect.update(dt)
    local mx, my = love.mouse.getPosition()
    
    -- Reset hover states
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

function modeselect.draw()
    love.graphics.setColor(1, 1, 1)
    
    -- Draw title
    love.graphics.print("Select Game Mode", ww/2 - 100, 100)
    
    -- Draw buttons with hover effect
    for button, pos in pairs(buttons) do
        local image = modeImages[button]
        if pos.isHovered then
            love.graphics.setColor(0.8, 0.8, 1)
        else
            love.graphics.setColor(1, 1, 1)
        end
        love.graphics.draw(image, pos.x, pos.y)
    end
    
    -- Draw instruction
    love.graphics.setColor(102/255, 178/255, 1)
    love.graphics.print("Press Escape to return to main menu", 10, 10)
end

function modeselect.mousepressed(x, y, button)
    if button == 1 then
        for name, pos in pairs(buttons) do
            if x >= pos.x and x <= pos.x + pos.width and
               y >= pos.y and y <= pos.y + pos.height then
                sound.select:play()
                if name == "vs_computer" then
                    currentGame = require("game")
                    currentGame.load()
                    gameState = "game"
                    sound.music:stop()
                elseif name == "vs_player" then
                    currentGame = require("multip")
                    currentGame.load()
                    gameState = "game"
                    sound.music:stop()
                end
            end
        end
    end
end

return modeselect