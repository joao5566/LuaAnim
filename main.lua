local Animation = require("animation")
local anim

function love.load()
    -- Carregar o spritesheet
    local zombSheet = love.graphics.newImage("zombie_tilesheet.png")

    -- Criar uma instância da animação
    anim = Animation.new(zombSheet, 80, 110, {
        idle = {
            frames = { {linha = 1, frames = {1}}, {linha = 2, frames = {4}} },
            frameDuration = 0.5
        },
        walk = {
            frames = { {linha = 2, frames = {1, 2}} },
            frameDuration = 0.3
        },
        climb = {
            frames = { {linha = 3, frames = {6, 7}} },
            frameDuration = 0.4
        }
    }, 0.5)
end

function love.update(dt)
    -- Atualiza a animação
    anim:update(dt)

    -- Definir a animação ativa, altere conforme necessário
    anim:setAnimation("idle")
end

function love.draw()
    -- Desenha a animação na posição (100, 100)
    anim:draw(100, 100, 1)
end
