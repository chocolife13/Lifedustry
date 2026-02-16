require("src.screen")

function love.load() 
    
end


-- ces deux boucles sont les boucle principale du jeux


function love.update(dt) -- la partit mise a jour

end


function love.draw() -- la partit graphique
    love.graphics.print('Lifedustry', screen.relative_to_percent(600, 200))
end