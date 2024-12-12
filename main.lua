Animation = require("animation")
local anim
function love.load()
    
    zombSheet = love.graphics.newImage("zombie_tilesheet.png")

    anim = Animation.new(zombSheet,80,110,{
        idle = {1,24},
        walk = {10,11},
        climb ={6,7},
    },0.2)
    
end

function love.update(dt)
    anim:update(dt)

    

    anim:setAnimation("walk")
end

function love.draw()
    anim:draw(100,100,1)
end