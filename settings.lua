local settings = {}

-- Initialize volume controls
local volumeControls = {
    music = {
        value = 1.0,
        x = 0,
        y = 0,
        width = 200,
        height = 20,
        isDragging = false
    },
    sound = {
        value = 1.0,
        x = 0,
        y = 0,
        width = 200,
        height = 20,
        isDragging = false
    }
}


function settings.load()
    -- Position volume controls and buttons
    volumeControls.music.x = ww/2 - 100
    volumeControls.music.y = 150
    volumeControls.sound.x = ww/2 - 100
    volumeControls.sound.y = 250
end

function settings.update(dt)
    -- Update volume based on slider positions
    if love.mouse.isDown(1) then
        local mx, my = love.mouse.getPosition()
        
        -- Check music volume slider
        if settings.isMouseInSlider(mx, my, volumeControls.music) then
            volumeControls.music.value = settings.calculateVolume(mx, volumeControls.music)
            sound.music:setVolume(volumeControls.music.value)
        end
        
        -- Check sound effects volume slider
        if settings.isMouseInSlider(mx, my, volumeControls.sound) then
            volumeControls.sound.value = settings.calculateVolume(mx, volumeControls.sound)
            -- Update all game sounds
            for _, s in pairs(gameSounds) do
                s:setVolume(volumeControls.sound.value)
            end
            sound.select:setVolume(volumeControls.sound.value)
        end
    end
end

function settings.draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Settings Menu", ww/2 - 100, 100)
    love.graphics.print("Press Escape to return to menu", 10, 50)
    
    -- Draw volume sliders
    love.graphics.print("Music Volume:", volumeControls.music.x - 200, volumeControls.music.y)
    love.graphics.rectangle("line", volumeControls.music.x, volumeControls.music.y, 
                          volumeControls.music.width, volumeControls.music.height)
    love.graphics.rectangle("fill", volumeControls.music.x, volumeControls.music.y,
                          volumeControls.music.width * volumeControls.music.value, 
                          volumeControls.music.height)
    
    love.graphics.print("Sound Effects:", volumeControls.sound.x - 215, volumeControls.sound.y)
    love.graphics.rectangle("line", volumeControls.sound.x, volumeControls.sound.y,
                          volumeControls.sound.width, volumeControls.sound.height)
    love.graphics.rectangle("fill", volumeControls.sound.x, volumeControls.sound.y,
                          volumeControls.sound.width * volumeControls.sound.value,
                          volumeControls.sound.height)
end

-- Helper functions
function settings.isMouseInSlider(mx, my, slider)
    return mx >= slider.x and mx <= slider.x + slider.width and
           my >= slider.y and my <= slider.y + slider.height
end

function settings.calculateVolume(mx, slider)
    local value = (mx - slider.x) / slider.width
    return math.max(0, math.min(1, value))
end

return settings