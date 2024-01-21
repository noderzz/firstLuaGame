function love.load()
    -- Initialize variables
    window_height = 900
    window_length = 700
    score_height = 100
    score_length = 200
    score_x_coordinate = (window_length/2)

    -- Set background settings
    love.window.setMode(window_height, window_length)
    love.graphics.setBackgroundColor((39/255),(39/255),(39/255))
end

function love.update(dt)
end

function love.draw()
    love.graphics.setColor((212/255),(170/255),(125/255))
    love.graphics.rectangle("fill",score_x_coordinate,0,score_length,score_height)

    love.graphics.setColor((212/255),(170/255),(125/255))
    love.graphics.circle("fill",100,100,50)
end
