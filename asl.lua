function love.load()
    -- Initialize game state
    ww = love.graphics.getWidth()
    wh = love.graphics.getHeight()
    paw = love.graphics.getWidth("hands/wr9a.png")
    game = {
        player = {
            x = {
                paper = -paw, --start from left side
                rock = -paw,
                scissors = -paw
            },
            y = {
                paper = 200,
                rock = 200,
                scissors = 200
            },
            selected = nil,
            targetX = -200  -- Target position for sliding
        },
        computer = {
            x = {
                paper = ww,    -- Start from right side
                rock = ww,
                scissors = ww
            },
            y = {
                paper = 200,
                rock = 200,
                scissors = 200
            },
            selected = nil,
            targetX = 800     -- Target position for sliding
        },
        result = nil,
        animationSpeed = 1000  -- Pixels per second
    }
    
    -- Load images
    images = {
        paper = love.graphics.newImage("hands/wr9a.png"),
        rock = love.graphics.newImage("hands/7jra.png"),
        scissors = love.graphics.newImage("hands/m9es.png")
    }
end

function love.update(dt)
    love.graphics.setBackgroundColor(140/255, 62/255, 93/255)
    -- Handle input
    if not game.player.selected then
        if love.keyboard.isDown("x") then
            game.player.selected = "paper"
            game.player.targetX = (ww/2) - 200  -- Move to center from left
            
            -- Computer makes choice
            local choices = {"rock", "paper", "scissors"}
            game.computer.selected = choices[love.math.random(1, 3)]
            game.computer.targetX = (ww/2) - 350 -- Move to center from right
        elseif love.keyboard.isDown("c") then
            game.player.selected = "rock"
            game.player.targetX = (ww/2) - 200
            
            local choices = {"rock", "paper", "scissors"}
            game.computer.selected = choices[love.math.random(1, 3)]
            game.computer.targetX = (ww/2) - 350
        elseif love.keyboard.isDown("v") then
            game.player.selected = "scissors"
            game.player.targetX = (ww/2) - 200
            
            local choices = {"rock", "paper", "scissors"}
            game.computer.selected = choices[love.math.random(1, 3)]
            game.computer.targetX = (ww/2) - 350
        end
    end
    
    -- Animate player hand
    if game.player.selected then
        local currentX = game.player.x[game.player.selected]
        local targetX = game.player.targetX
        local distance = targetX - currentX
        local movement = game.animationSpeed * dt
        
        if math.abs(distance) > movement then
            if distance > 0 then
                game.player.x[game.player.selected] = currentX + movement
            else
                game.player.x[game.player.selected] = currentX - movement
            end
        else
            game.player.x[game.player.selected] = targetX
        end
    end
    
    -- Animate computer hand
    if game.computer.selected then
        local currentX = game.computer.x[game.computer.selected]
        local targetX = game.computer.targetX
        local distance = targetX - currentX
        local movement = game.animationSpeed * dt
        
        if math.abs(distance) > movement then
            if distance > 0 then
                game.computer.x[game.computer.selected] = currentX + movement
            else
                game.computer.x[game.computer.selected] = currentX - movement
            end
        else
            game.computer.x[game.computer.selected] = targetX
            
            -- Determine winner once animation is complete
            if not game.result and game.player.x[game.player.selected] == game.player.targetX then
                game.result = determineWinner(game.player.selected, game.computer.selected)
            end
        end
    end
end

function love.draw()
    -- Draw player's hand options
    for _, choice in ipairs({"paper", "rock", "scissors"}) do
        love.graphics.draw(images[choice], game.player.x[choice], game.player.y[choice])
    end
    
    -- Draw computer's hand
    if game.computer.selected then
        love.graphics.draw(images[game.computer.selected], 
        game.computer.x[game.computer.selected], 
        game.computer.y[game.computer.selected],
        0, -- rotation
        -1, -- flip horizontally
        1,  -- no vertical flip
        images[game.computer.selected]:getWidth(), -- offset for flipping
        1)
    end

    font = love.graphics.newFont("font/Press_Start_2P/PressStart2P-Regular.ttf", 15)
    -- Draw game result if exists
    if game.result then
        love.graphics.setColor(1, 0, 0)
        if (game.result == "It's a tie!") then
            
            love.graphics.setColor(1, 1, 1) -- white collor
            love.graphics.print(game.result, ((ww/2) - 80), 100)
        end
        if (game.result == "Computer wins!") then
            love.graphics.setColor(1, 0, 0) -- red collor
            love.graphics.print(game.result, ((ww/2) + 50), 100)
        end
        if (game.result == "You win!") then
            love.graphics.setColor(0, 1, 0) -- green collor
            love.graphics.print(game.result, ((ww/2) - 200), 100)
        end
    end
    
    -- Draw instructions
    love.graphics.setColor(1,1,0) -- yello collor
    love.graphics.setFont(font)
    love.graphics.print("Press: X for Paper, C for Rock, V for Scissors", 10, 10)
    love.graphics.print("Press Space to reset", 10, 30)
end

function determineWinner(player, computer)
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

function love.keypressed(key)
    if key == "space" then
        -- Reset game state
        game.player.selected = nil
        game.computer.selected = nil
        game.result = nil
        
        -- Reset positions
        for _, choice in ipairs({"paper", "rock", "scissors"}) do
            game.player.x[choice] = -200
            game.computer.x[choice] = 800
        end
    end
end