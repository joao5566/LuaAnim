# Animation Library Documentation

This simple Lua library facilitates the use of sprite sheet animations in Love2D. It is lightweight, efficient, and customizable for various game projects.

## Key Features

- Automatic generation of quads for animations based on indices.
- Animation control (switching animations, updating frames).
- Rendering of animated frames on screen.
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
- `animations`: A table where each key is the animation name and the values are the frame indices.
- `frameDuration`: Time (in seconds) each frame is displayed.

**Example:**

```lua
function love.load()
    local zombSheet = love.graphics.newImage("zombie_tilesheet.png")

    anim = Animation.new(zombSheet, 80, 110, {
        idle = {1, 2, 3, 4},
        walk = {5, 6, 7, 8}
    }, 0.2)
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

### Animation.new(image, frameWidth, frameHeight, animations, frameDuration)
Creates a new animation instance.

### anim:update(dt)
Updates the current frame of the animation based on elapsed time.

### anim:draw(x, y, scaleX, scaleY)
Renders the animation on the screen.

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
        idle = {1, 2, 3, 4},
        walk = {5, 6, 7, 8}
    }, 0.2)
end

function love.update(dt)
    anim:update(dt)

    if love.keyboard.isDown("right") then
        anim:setAnimation("walk")
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
2. **Different Animation Speeds:** Allow each animation to have a distinct frame duration.
3. **Reverse Playback:** Add support for playing animations backward.
4. **Pause/Resume:** Implement methods to pause and resume animations.

---

This library is lightweight and efficient for most games. Use it as a foundation for your needs and customize it as necessary. Happy coding!


## Credits

- Zombie sprite sheet used for testing was created by [Kenney](https://kenney.nl/).



