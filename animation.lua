local Animation = {}
Animation.__index = Animation

function Animation.new(image, frameWidth, frameHeight, animations, frameDuration)
    local obj = {
        image = image,
        frameWidth = frameWidth,
        frameHeight = frameHeight,
        animations = {}, -- Tabelas com os quads de cada animação
        frameDuration = frameDuration,
        currentAnimation = nil, -- Animação ativa
        elapsedTime = 0,
        currentFrame = 1,
    }

    -- Calcula os quads para cada animação com base nos índices fornecidos
    for name, indices in pairs(animations) do
        obj.animations[name] = {}
        for _, index in ipairs(indices) do
            local cols = math.floor(image:getWidth() / frameWidth)
            local x = ((index - 1) % cols) * frameWidth
            local y = math.floor((index - 1) / cols) * frameHeight

            local quad = love.graphics.newQuad(
                x, y, 
                frameWidth, frameHeight, 
                image:getWidth(), image:getHeight()
            )
            table.insert(obj.animations[name], quad)
        end
    end

    setmetatable(obj, Animation)
    return obj
end

function Animation:update(dt)
    if self.currentAnimation then
        self.elapsedTime = self.elapsedTime + dt
        if self.elapsedTime >= self.frameDuration then
            self.elapsedTime = self.elapsedTime - self.frameDuration
            self.currentFrame = self.currentFrame + 1
            if self.currentFrame > #self.animations[self.currentAnimation] then
                self.currentFrame = 1
            end
        end
    end
end

function Animation:draw(x, y, scaleX, scaleY)
    scaleX = scaleX or 1
    scaleY = scaleY or 1
    if self.currentAnimation then
        local quad = self.animations[self.currentAnimation][self.currentFrame]
        love.graphics.draw(self.image, quad, x, y, 0, scaleX, scaleY)
    end
end

function Animation:setAnimation(name)
    if self.animations[name] and self.currentAnimation ~= name then
        self.currentAnimation = name
        self.currentFrame = 1
        self.elapsedTime = 0
    end
end

return Animation

