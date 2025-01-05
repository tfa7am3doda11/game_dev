local game = {}

local gameImages
local gameState
local paw

function game.load()
    paw = love.graphics.getWidth("hands/wr9a.png")
    
    gameImages = {
        paper = love.graphics.newImage("hands/wr9a.png"),
        rock = love.graphics.newImage("hands/7jra.png"),
        scissors = love.graphics.newImage("hands/m9es.png")
    }
    gameSounds = {
        paper = love.audio.newSource("sounds/paper.mp3", "static"),
        rock = love.audio.newSource("sounds/rock.mp3", "static"),
        scissors = love.audio.newSource("sounds/scissor.mp3", "static")
    }
    game.initializeGame()
end

function game.initializeGame()
    gameState = {
        player1 = {
            x = {
                paper = -paw,
                rock = -paw,
                scissors = -paw
            },
            y = {
                paper = 200,
                rock = 250,
                scissors = 250
            },
            selected = nil,
            targetX = -200,
            score = 0,
            hasChosen = false
        },
        player2 = {
            x = {
                paper = ww,
                rock = ww,
                scissors = ww
            },
            y = {
                paper = 200,
                rock = 250,
                scissors = 250
            },
            selected = nil,
            targetX = 800,
            score = 0,
            hasChosen = false
        },
        result = nil,
        animationSpeed = 1000,
        animationStarted = false
    }
end

function game.update(dt)
    love.graphics.setBackgroundColor(140/255, 62/255, 93/255)

    -- Only accept input if animation hasn't started
    if not gameState.animationStarted then
        -- Player 1 controls (X, C, V)
        if not gameState.player1.hasChosen then
            if love.keyboard.isDown("x") then
                game.selectChoice("player1", "paper")
            elseif love.keyboard.isDown("c") then
                game.selectChoice("player1", "rock")
            elseif love.keyboard.isDown("v") then
                game.selectChoice("player1", "scissors")
            end
        end
        
        -- Player 2 controls (I, O, P)
        if not gameState.player2.hasChosen then
            if love.keyboard.isDown("i") then
                game.selectChoice("player2", "paper")
            elseif love.keyboard.isDown("o") then
                game.selectChoice("player2", "rock")
            elseif love.keyboard.isDown("p") then
                game.selectChoice("player2", "scissors")
            end
        end
    end
    
    -- Only start animation if both players have chosen
    if gameState.player1.hasChosen and gameState.player2.hasChosen then
        gameState.animationStarted = true
        game.updateAnimation(dt)
    end
end

function game.selectChoice(player, choice)
    gameState[player].selected = choice
    gameState[player].hasChosen = true
    gameState[player].targetX = (player == "player1") and (ww/2 - 200) or (ww/2 + 100)
end

function game.updateAnimation(dt)
    -- Update both players' animations
    for _, player in ipairs({"player1", "player2"}) do
        if gameState[player].selected then
            local currentX = gameState[player].x[gameState[player].selected]
            local targetX = gameState[player].targetX
            local distance = targetX - currentX
            local movement = gameState.animationSpeed * dt
            
            if math.abs(distance) > movement then
                gameState[player].x[gameState[player].selected] = currentX + (distance > 0 and movement or -movement)
            else
                gameState[player].x[gameState[player].selected] = targetX
                
                -- Determine winner when both animations are complete
                if not gameState.result and 
                   gameState.player1.x[gameState.player1.selected] == gameState.player1.targetX and
                   gameState.player2.x[gameState.player2.selected] == gameState.player2.targetX then
                    
                    gameState.result = game.determineWinner()
                    
                    -- Update scores and play sounds
                    if gameState.result == "Player 1 wins!" then
                        gameState.player1.score = gameState.player1.score + 1
                        gameSounds[gameState.player1.selected]:play()
                    elseif gameState.result == "Player 2 wins!" then
                        gameState.player2.score = gameState.player2.score + 1
                        gameSounds[gameState.player2.selected]:play()
                    end
                end
            end
        end
    end
end

function game.draw()
    -- Draw scores
    love.graphics.setColor(0, 1, 0)
    love.graphics.print("Player 1 Score: " .. gameState.player1.score, ((ww/2) - 300), 70)
    love.graphics.setColor(1, 0, 0)
    love.graphics.print("Player 2 Score: " .. gameState.player2.score, ww/2 + 50, 70)
    love.graphics.setColor(1, 1, 1)
    
    -- Only draw hands if animation has started or it's the player's own choice
    for _, player in ipairs({"player1", "player2"}) do
        for _, choice in ipairs({"paper", "rock", "scissors"}) do
            -- Only draw selected hands if animation has started
            if not gameState[player].selected or gameState.animationStarted then
                love.graphics.draw(gameImages[choice], 
                    gameState[player].x[choice], 
                    gameState[player].y[choice],
                    0,
                    player == "player2" and -1 or 1,
                    1,
                    player == "player2" and gameImages[choice]:getWidth() or 0,
                    0)
            end
        end
    end

    -- Draw selection status if not all players have chosen
    if not gameState.animationStarted then
        love.graphics.setColor(1, 1, 1)
        if gameState.player1.hasChosen then
            love.graphics.print("Player 1 has chosen!", ((ww/2) - 300), 120)
        end
        if gameState.player2.hasChosen then
            love.graphics.print("Player 2 has chosen!", ww/2 + 50, 120)
        end
    end

    -- Draw result
    if gameState.result then
        if gameState.result == "It's a tie!" then
            love.graphics.setColor(1, 1, 1)
            love.graphics.print(gameState.result, ((ww/2) - 80), 100)
        elseif gameState.result == "Player 1 wins!" then
            love.graphics.setColor(0, 1, 0)
            love.graphics.print(gameState.result, ((ww/2) - 200), 100)
        elseif gameState.result == "Player 2 wins!" then
            love.graphics.setColor(1, 0, 0)
            love.graphics.print(gameState.result, ((ww/2) + 50), 100)
        end
    end
    
    -- Draw instructions
    love.graphics.setColor(102/255, 178/255, 1)
    love.graphics.print("Player 1: X for Paper, C for Rock, V for Scissors", 10, wh - 50)
    love.graphics.print("Player 2: I for Paper, O for Rock, P for Scissors", 10, wh - 30)
    love.graphics.print("Press Space to reset", 10, 30)
    love.graphics.print("Press Escape to return to menu", 10, 10)
end

function game.determineWinner()
    local p1 = gameState.player1.selected
    local p2 = gameState.player2.selected
    
    if p1 == p2 then
        return "It's a tie!"
    elseif (p1 == "rock" and p2 == "scissors") or
           (p1 == "paper" and p2 == "rock") or
           (p1 == "scissors" and p2 == "paper") then
        return "Player 1 wins!"
    else
        return "Player 2 wins!"
    end
end

function game.keypressed(key)
    if key == "space" then
        -- Reset all game state
        gameState.player1.selected = nil
        gameState.player2.selected = nil
        gameState.result = nil
        gameState.animationStarted = false
        gameState.player1.hasChosen = false
        gameState.player2.hasChosen = false
        
        -- Reset positions
        for _, choice in ipairs({"paper", "rock", "scissors"}) do
            gameState.player1.x[choice] = -paw
            gameState.player2.x[choice] = ww
        end
    end
end

return game