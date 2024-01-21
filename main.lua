function love.load()
    -- Initialize variables
    window_height = 900
    window_length = 700

    score = 0
    score_height = 100
    score_length = 200
    score_x_coordinate = (window_length/2)

    target = {}
    target.radius = 50
    target.x = math.random(target.radius, window_height-target.radius)
    target.y = math.random(target.radius, window_length-target.radius)
    
    timer = 0

    -- Font Size
    gameFont = love.graphics.newFont(40)
    font_adjustment = 15

    -- Set background settings
    love.window.setMode(window_height, window_length)
    love.graphics.setBackgroundColor((39/255),(39/255),(39/255))
end

function love.update(dt)
end

function love.draw()
    -- Set the 'Score' card.
    love.graphics.setColor((239/255),(208/255),(158/255))
    love.graphics.rectangle("fill",score_x_coordinate,0,score_length,score_height)
    love.graphics.setColor((144/255),(169/255),(183/255))
    local textWidth = gameFont:getWidth("Score")
    love.graphics.print("SCORE",(score_x_coordinate+(score_length/2)-(score_length-textWidth)/1.3),0)

    -- Update 'Score' in real time.
    if type(score) == "number" and score >= 10 and score <= 99 then
        font_adjustment = 30
    elseif type(score) == "number" and score >= 100 and score <= 999 then
        font_adjustment = 45
    else
        font_adjustment = 15
    end
    love.graphics.setFont(gameFont)
    love.graphics.print(score,(score_x_coordinate+(score_length/2)-font_adjustment),50)

    love.graphics.setColor((144/255),(169/255),(183/255))
    love.graphics.circle("fill",target.x,target.y,target.radius)
end

function love.mousepressed( x, y, button, istouch, presses )
    -- Increase score every time button is pressed
    if button == 1 then
        local mouseToTarget = distanceBetween(x, y, target.x, target.y)
        if mouseToTarget < target.radius then
            score = score + 1
            target.x = math.random(target.radius, window_height-target.radius)
            target.y = math.random(target.radius, window_length-target.radius)
        end
    end
end

function distanceBetween(x1, y1, x2, y2)
    return math.sqrt( (x2-x1)^2 + (y2-y1)^2 )
end