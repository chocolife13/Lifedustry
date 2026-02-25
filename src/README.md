# Scenes

In Lifedustry, game states (such as the main menu, the game world, or a settings screen) are called **scenes**. The `scene_manager` is responsible for loading and switching between these scenes.

This guide explains how to create your own scene.

## How to Create a New Scene

Creating a new scene involves two main steps: creating the scene file and then registering it with the `scene_manager`.

### 1. Create the Scene File

First, create a new `.lua` file in this folder (`src/scene/`). The filename will be the name of your scene. For example, let's create `my_great_scene.lua`.

This file must return a table containing three functions: `load()`, `update(dt)`, and `draw()`. You can use the template below.

**File: `src/scene/my_great_scene.lua`**
```lua
local my_great_scene = {}

-- This function is called once when the scene is loaded.
-- Use it to initialize variables, load scene-specific assets, etc.
function my_great_scene.load()
    print("My Great Scene is loading!")
end

-- This function is called every frame.
-- 'dt' (delta time) is the time in seconds since the last frame.
-- Use it for game logic, such as moving characters or updating animations.
function my_great_scene.update(dt)
    -- Your game logic here
end

-- This function is also called every frame, after update().
-- Use it to draw everything related to this scene to the screen.
function my_great_scene.draw()
    love.graphics.print("Welcome to My Great Scene!", 400, 300)
end

return my_great_scene

```

### 2. Register the Scene

Now that you have your scene file, you need to let the `scene_manager` know about it. Open `src/scene/scene_manager.lua` and add a new entry for your scene in the `api.list` table.

### 3. Test Your Scene

You can now launch the game and load your scene directly using a command-line argument. This is useful for testing.

```bash
love ./ --scene my_great_scene

```

This will bypass the default loading flow and start your scene immediately.


