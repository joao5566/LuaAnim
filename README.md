# Animation Library Documentation

This simple Lua library facilitates the use of sprite sheet animations in Love2D. It is lightweight, efficient, and customizable for various game projects.

## Key Features

- Automatic generation of quads for animations based on indices.
- Support for selecting specific rows of frames in the sprite sheet.
- Per-animation frame duration control.
- Animation control (switching animations, updating frames).
- Rendering of animated frames on screen.
- Centering animation frames on the body for alignment.
- Simplicity for adding new functionalities as needed.

---

## How to Use

### 1. Import the Library

Ensure the `animation.lua` file is in the same directory as your project.

```lua
Animation = require("animation")
```

### 2. Create an Animation Instance

Use the `Animation.new` method to create a new animation.

**Parameters:**
- `image`: The sprite sheet (image loaded with `love.graphics.newImage`).
- `frameWidth`: Width of each frame in the sprite sheet.
- `frameHeight`: Height of each frame in the sprite sheet.
- `animations`: A table where each key is the animation name and the values define the frames and rows.
- `defaultFrameDuration`: Default time (in seconds) each frame is displayed if no specific duration is provided for an animation.

You can specify animations using individual frame indices or by selecting specific rows and frames using `{linha = rowNumber, frames = {startFrame, ..., endFrame}}`. Additionally, you can provide a custom `frameDuration` for each animation.

**Example:**

```lua
function love.load()
    local zombSheet = love.graphics.newImage("zombie_tilesheet.png")

    anim = Animation.new(zombSheet, 80, 110, {
        idle = {
            frames = { {linha = 1, frames = {1, 2, 3}}, {linha = 2, frames = {1, 2}} }, -- Combines frames from two rows
            frameDuration = 0.5 -- Custom frame duration for "idle"
        },
        walk = {
            frames = { {linha = 3, frames = {1, 2, 3, 4}} }, -- Frames 1-4, Row 3
            frameDuration = 0.2 -- Custom frame duration for "walk"
        },
        climb = {
            frames = { {linha = 4, frames = {1, 2}} },       -- Frames 1-2, Row 4
            frameDuration = 0.3 -- Custom frame duration for "climb"
        }
    }, 0.3) -- Default frame duration if not specified
end
```

### 3. Update the Animation

In the `love.update` callback, use the `anim:update(dt)` method to update the animation frames based on elapsed time.

**Example:**

```lua
function love.update(dt)
    anim:update(dt)

    if love.keyboard.isDown("right") then
        anim:setAnimation("walk")
    elseif love.keyboard.isDown("up") then
        anim:setAnimation("climb")
    else
        anim:setAnimation("idle")
    end
end
```

### 4. Draw the Animation

In the `love.draw` callback, use the `anim:draw(x, y, scaleX, scaleY)` method to render the animation.

**Parameters:**
- `x`: Horizontal position to draw the animation.
- `y`: Vertical position to draw the animation.
- `scaleX`: Horizontal scale (optional, default: 1).
- `scaleY`: Vertical scale (optional, default: 1).

**Example:**

```lua
function love.draw()
    anim:draw(100, 100, 1, 1)
end
```

---

## Available Methods

### Animation.new(image, frameWidth, frameHeight, animations, defaultFrameDuration)
Creates a new animation instance.

- **New Feature:** You can now specify animations by row using `{linha = rowNumber, frames = {startFrame, ..., endFrame}}` format.
- **New Feature:** Each animation can have a custom `frameDuration`.

### anim:update(dt)
Updates the current frame of the animation based on elapsed time.

### anim:draw(x, y, scaleX, scaleY)
Renders the animation on the screen, automatically centering the frame relative to the body.

### anim:setAnimation(name)
Switches to a specified animation by name.

---

## Complete Example

```lua
Animation = require("animation")

local anim

function love.load()
    zombSheet = love.graphics.newImage("zombie_tilesheet.png")

    anim = Animation.new(zombSheet, 80, 110, {
        idle = {
            frames = { {linha = 1, frames = {1, 2, 3}}, {linha = 2, frames = {1, 2}} }, -- Combines frames from two rows
            frameDuration = 0.5
        },
        walk = {
            frames = { {linha = 3, frames = {1, 2, 3, 4}} }, -- Frames 1-4, Row 3
            frameDuration = 0.2
        },
        climb = {
            frames = { {linha = 4, frames = {1, 2}} },       -- Frames 1-2, Row 4
            frameDuration = 0.3
        }
    }, 0.3)
end

function love.update(dt)
    anim:update(dt)

    if love.keyboard.isDown("right") then
        anim:setAnimation("walk")
    elseif love.keyboard.isDown("up") then
        anim:setAnimation("climb")
    else
        anim:setAnimation("idle")
    end
end

function love.draw()
    anim:draw(100, 100)
end
```

---

## Potential Improvements

If additional functionality is required, here are some ideas:

1. **Support for Callbacks:** Add events triggered at the end of an animation.
2. **Reverse Playback:** Add support for playing animations backward.
3. **Pause/Resume:** Implement methods to pause and resume animations.
4. **Animation Blending:** Support for smooth transitions between animations.

---

This library is lightweight and efficient for most games. Use it as a foundation for your needs and customize it as necessary. Happy coding!

---

## Credits

- Zombie sprite sheet used for testing was created by [Kenney](https://kenney.nl/).
- The zombie sprite sheet included in this project is licensed under Creative Commons Zero (CC0). More details: http://creativecommons.org/publicdomain/zero/1.0/
