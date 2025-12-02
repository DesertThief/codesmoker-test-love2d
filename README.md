# CodeSmoker Test: LÖVE2D Lua Game (#20)

A test repository for the CodeSmoker test suite demonstrating a LÖVE2D Lua game.

## Project Structure

```
├── main.lua              # Main game file
├── conf.lua              # LÖVE configuration
├── entity.lua            # Entity module
└── utils.lua             # Utility functions
```

## Features

- **LÖVE2D Framework**: 2D game engine for Lua
- **Game Loop**: Update and draw callbacks
- **Input Handling**: Keyboard controls
- **Collision Detection**: Ball-paddle collision
- **Score System**: Points and game over
- **Modular Code**: Separate entity and utility modules

## Game Controls

| Key | Action |
|-----|--------|
| ← / A | Move paddle left |
| → / D | Move paddle right |
| SPACE | Restart (after game over) |
| ESC | Quit game |

## Getting Started

### Prerequisites

- LÖVE2D >= 11.4 ([love2d.org](https://love2d.org))

### Install LÖVE2D

```bash
# macOS
brew install love

# Ubuntu/Debian
sudo apt install love

# Windows
# Download from https://love2d.org
```

### Run the Game

```bash
# From the project directory
love .

# Or specify the folder
love /path/to/codesmoker-test-love2d
```

### Package as .love File

```bash
cd codesmoker-test-love2d
zip -9 -r ../mygame.love .
love ../mygame.love
```

## Code Structure

### main.lua

```lua
function love.load()
    -- Initialize game
end

function love.update(dt)
    -- Update game logic
end

function love.draw()
    -- Render graphics
end

function love.keypressed(key)
    -- Handle key presses
end
```

### conf.lua

```lua
function love.conf(t)
    t.window.title = "My Game"
    t.window.width = 800
    t.window.height = 600
end
```

## Documentation

Built using latest documentation from:
- [LÖVE Wiki](https://love2d.org/wiki) - LÖVE2D documentation

---

*This is a CodeSmoker test repository*
