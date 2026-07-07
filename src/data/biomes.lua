biomes = {}

-- the number is the priority levels bc it list 1 23 etc

biomes[1] = {
    noises = {
        temperature = {min = 0, max = 1}, 
        height = {min = 0, max = 1}
    },
    mob = "chicken",
    floor = "grass"
}


biomes[2] = {
    noises = {
        temperature = {min = 0.8, max = 1}, 
        height = {min = 0.2, max = 1}
    },
    mob = "ball",
    floor = "sand"
}


biomes[3] = {
    noises = {
        temperature = {min = 0, max = 0.3}, 
        height = {min = 0.5, max = 1}
    },
    mob = "snowman",
    floor = "snow"
}

biomes[4] = {
    noises = {
        temperature = {min = 0.2, max = 1}, 
        height = {min = 0, max = 0.2}
    },
    mob = "fish",
    floor = "water"
}

biomes[5] = {
    noises = {
        temperature = {min = 0, max = 1}, 
        height = {min = 0.8, max = 1}
    },
    mob = "run",
    floor = "stone"
}


return biomes