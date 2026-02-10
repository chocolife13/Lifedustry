-- Ce fichier sert a definir les block et leurs comportements

tile = {}

tile[0] = {
    name = "void", 
    type = "WTF"
}

tile[1] = {
    name = "cobblestone", 
    type = "block",
    texture = love.graphics.newImage("assets/textures/blocks/cobblestone.png")
}
tile[2] = {
    name = "grass", 
    type = "block",
    texture = love.graphics.newImage("assets/textures/blocks/grass.png")
}

tile[3] = {
    name = "rock", 
    type = "",
    texture = love.graphics.newImage("assets/textures/objects/rock.png")
}

tile[4] = {
    name = "grass", 
    type = "",
    texture = love.graphics.newImage("assets/textures/objects/grass.png")
}

tile[5] = {
    name = "tree", 
    type = "",
    texture = love.graphics.newImage("assets/textures/objects/tree.png")
}