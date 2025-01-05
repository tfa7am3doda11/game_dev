-- Import modules
local menu = require("menu")
local game = require("game")
local settings = require("settings")
local modeselect = require("modeselect")  -- Changed from gamemode

function love.load()
    -- Initialize window dimensions
    ww = love.graphics.getWidth()
    wh = love.graphics.getHeight()
    
    -- Current game state
    gameState = "menu"
    
    -- Initialize scores
    playerScore = 0
    computerScore = 0
    
    -- Current game module (for switching between single and multiplayer)
    currentGame = game
    
    -- Load font
    font = love.graphics.newFont("font/Press_Start_2P/PressStart2P-Regular.ttf", 15)
    love.graphics.setFont(font)
    
    -- Initialize sound
    sound = {}
    sound.music = love.audio.newSource("sounds/music.mp3", "stream")
    sound.select = love.audio.newSource("sounds/select.mp3", "static")
    sound.music:setLooping(true)
    sound.music:play()
    gameSounds = {
        paper = love.audio.newSource("sounds/paper.mp3", "static"),
        rock = love.audio.newSource("sounds/rock.mp3", "static"),
        scissors = love.audio.newSource("sounds/scissor.mp3", "static")
    }
    
    -- Initialize all modules
    menu.load()
    modeselect.load()  -- Changed from gamemode
    game.load()
    settings.load()
end

function love.update(dt)
    -- Set background color
    love.graphics.setBackgroundColor(153/255, 153/255, 1)
    
    if gameState == "menu" then
        menu.update(dt)
    elseif gameState == "modeselect" then  -- Changed from gamemode
        modeselect.update(dt)
    elseif gameState == "game" then
        currentGame.update(dt)
    elseif gameState == "settings" then
        settings.update(dt)
    end
end

function love.draw()
    if gameState == "menu" then
        menu.draw()
    elseif gameState == "modeselect" then  -- Changed from gamemode
        modeselect.draw()
    elseif gameState == "game" then
        currentGame.draw()
    elseif gameState == "settings" then
        settings.draw()
    end
end

function love.mousepressed(x, y, button)
    if gameState == "menu" then
        menu.mousepressed(x, y, button)
    elseif gameState == "modeselect" then  -- Changed from gamemode
        modeselect.mousepressed(x, y, button)
    end
end

function love.keypressed(key)
    if key == "escape" then
        if gameState == "modeselect" then  -- Changed from gamemode
            gameState = "menu"
        elseif gameState == "game" or gameState == "settings" then
            gameState = "menu"
            sound.music:play()
        end
    elseif gameState == "game" then
        currentGame.keypressed(key)
    end
end