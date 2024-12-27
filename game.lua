local game = {}

local gameImages
local gameState
local paw

function game.load()
    paw = love.graphics.getWidth("hands/wr9a.png")
    
    -- Load game images
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
        player = {
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
            targetX = -200
        },
        computer = {
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
            targetX = 800
        },
        result = nil,
        animationSpeed = 1000
    }
end

function game.update(dt)
    love.graphics.setBackgroundColor(140/255, 62/255, 93/255)

    -- Handle input
    if not gameState.player.selected then
        if love.keyboard.isDown("x") then
            game.selectChoice("paper")
        elseif love.keyboard.isDown("c") then
            game.selectChoice("rock")
        elseif love.keyboard.isDown("v") then
            game.selectChoice("scissors")
        end
    end
    
    game.updateAnimation(dt)
end

function game.selectChoice(choice)
    
    gameState.player.selected = choice
    gameState.player.targetX = (ww/2) - 200
    
    local choices = {"rock", "paper", "scissors"}
    gameState.computer.selected = choices[love.math.random(1, 3)]
    gameState.computer.targetX = (ww/2) + 100
end

function game.updateAnimation(dt)
    -- Animate player hand
    if gameState.player.selected then
        local currentX = gameState.player.x[gameState.player.selected]
        local targetX = gameState.player.targetX
        local distance = targetX - currentX
        local movement = gameState.animationSpeed * dt
        
        if math.abs(distance) > movement then
            if distance > 0 then
                gameState.player.x[gameState.player.selected] = currentX + movement
            else
                gameState.player.x[gameState.player.selected] = currentX - movement
            end
        else
            gameState.player.x[gameState.player.selected] = targetX
        end
    end
    
    -- Animate computer hand
    if gameState.computer.selected then
        local currentX = gameState.computer.x[gameState.computer.selected]
        local targetX = gameState.computer.targetX
        local distance = targetX - currentX
        local movement = gameState.animationSpeed * dt
        
        if math.abs(distance) > movement then
            if distance > 0 then
                gameState.computer.x[gameState.computer.selected] = currentX + movement
            else
                gameState.computer.x[gameState.computer.selected] = currentX - movement
            end
        else
            gameState.computer.x[gameState.computer.selected] = targetX
            
            if not gameState.result and gameState.player.x[gameState.player.selected] == gameState.player.targetX then
                gameState.result = game.determineWinner(gameState.player.selected, gameState.computer.selected)
                
                -- Play the winner's sound
                if gameState.result == "You win!" then
                    playerScore = playerScore + 1
                    gameSounds[gameState.player.selected]:play()
                elseif gameState.result == "Computer wins!" then
                    computerScore = computerScore + 1
                    gameSounds[gameState.computer.selected]:play()
                end
            end
        end
    end
end

function game.draw()
    love.graphics.setColor(0, 1, 0)  -- set color to green
    -- Draw scores
    love.graphics.print("Player Score: " .. playerScore, ((ww/2) - 300), 70)
    love.graphics.setColor(1, 0, 0) -- set color to red
    love.graphics.print("Computer Score: " .. computerScore, ww/2 + 50, 70)
    love.graphics.setColor(1, 1, 1) -- reset color to white
    
    -- Draw player's hand options
    for _, choice in ipairs({"paper", "rock", "scissors"}) do
        love.graphics.draw(gameImages[choice], gameState.player.x[choice], gameState.player.y[choice])
    end
    
    -- Draw computer's hand
    if gameState.computer.selected then
        love.graphics.draw(gameImages[gameState.computer.selected], 
        gameState.computer.x[gameState.computer.selected], 
        gameState.computer.y[gameState.computer.selected],
        0,
        -1,
        1,
        gameImages[gameState.computer.selected]:getWidth(),
        1)
    end

    -- Draw game result
    if gameState.result then
        if gameState.result == "It's a tie!" then
            love.graphics.setColor(1, 1, 1)
            love.graphics.print(gameState.result, ((ww/2) - 80), 100)
        elseif gameState.result == "Computer wins!" then
            love.graphics.setColor(1, 0, 0)
            love.graphics.print(gameState.result, ((ww/2) + 50), 100)
        elseif gameState.result == "You win!" then
            love.graphics.setColor(0, 1, 0)
            love.graphics.print(gameState.result, ((ww/2) - 200), 100)
        end
    end
    
    -- Draw instructions
    love.graphics.setColor(102/255, 178/255, 1)
    love.graphics.print("Press: X for Paper, C for Rock, V for Scissors", 10, wh - 30)
    love.graphics.print("Press Space to reset", 10, 30)
    love.graphics.print("Press Escape to return to menu", 10, 10)
end

function game.determineWinner(player, computer)
    if player == computer then
        return "It's a tie!"
    elseif (player == "rock" and computer == "scissors") or
           (player == "paper" and computer == "rock") or
           (player == "scissors" and computer == "paper") then
        return "You win!"
    else
        return "Computer wins!"
    end
end

function game.keypressed(key)
    if key == "space" then
        -- Reset game state
        gameState.player.selected = nil
        gameState.computer.selected = nil
        gameState.result = nil
        
        -- Reset positions
        for _, choice in ipairs({"paper", "rock", "scissors"}) do
            gameState.player.x[choice] = -paw
            gameState.computer.x[choice] = ww
        end
    end
end

return game