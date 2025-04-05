### Pico8-and-Picotron-Snippets
This is a collection of solutions to common gamedev problems in Pico8. The solutions range from small to big. They are supposed to be easy to use to get you started right away. If you need more parameters feel free to modify the functions or have a look at other peoples work! 

## How to Use
Feel free to copy the contents of any of these files to your Pico8 project. I've written them with usability and readability in mind, they are NOT shrinked yet. If you decide to use and shrink 'em feel free to share those versions with me. 
Feel free to abbreviate the function names etc. (Especially if you're coding in-engine)

## Contents:
- A **two tone print function** that prints text in multiple colors.
  
  ![tt_print](https://github.com/taxicomics/Pico8-and-Picotron-Snippets/assets/168220579/71cc15f3-f0f0-4f4e-9a14-f20b33274de8)
- A function that helps you to develop good enemy behavior. It checks whether two points on a map **can "see"** each other based on the map data. It assumes flag 0 to be the collision layer.

  ![lineofsight_2](https://github.com/taxicomics/Pico8-and-Picotron-Snippets/assets/168220579/aa5d805f-8d5f-4351-afc7-123281ceed01)
- A function to **draw animated sprites** without the need for an external animation variable or timer. Useful for things like animated logos, animated foliage or water. Things that always do the same thing regardless of their surroundings.

- A function to **draw animated sprites** that takes an array of sprite-frames as an argument. This is useful if your animation frames are not organized on your spritessheet or you want to use different sets of animations. Keep in mind that this function does NOT start at
  "frame 0" of your animation but is bound to `time()` So only use animations that loop easily.

  ![Animated_sprite](https://github.com/taxicomics/Pico8-and-Picotron-Snippets/assets/168220579/0e5009d4-022b-4532-a1d7-534c9df49c3a)
- ChatGPT splurted out a **Terrain** function that I cleaned up a bit(lot). It smoothes random noise and generates nice terrains. I used it for my flooded caves clone, but maybe somebody else has a use for it, too. You can define it`s behavior in the last bit of the function, as an example I let it set pixel values on the sprite sheet. You could also set map tiles here. It is rather slow, but it can probably be enhanced by somebody smarter than me.

  ![terrain](https://github.com/taxicomics/Pico8-and-Picotron-Snippets/assets/168220579/6cab32f0-d802-4898-af49-63094a14ddc8)


- A minimal setup dialogue function for scrolling dialogues. Add new dialogue content with a single function and display text whenever there is text to display.

  ![untitled_1_1](https://github.com/taxicomics/Pico8-and-Picotron-Snippets/assets/168220579/85917249-22c1-466f-8472-33f75d3fc6a9)
  ![untitled_1_0](https://github.com/taxicomics/Pico8-and-Picotron-Snippets/assets/168220579/b4ac1cd7-549d-458d-b427-3621d85577ac)

- I finally wrote my own (slow and buggy) A* implementation. And after that was done I asked for feedback. @ablebody was very nice and helpful and explained all of his changes and improvements. Now it IS a quick pathfinding algorithm that you may use. 
  ![image](https://github.com/taxicomics/Pico8-and-Picotron-Snippets/assets/168220579/447e4e24-8077-4cf6-b9a6-7c37eab8439a)

- A function that takes a float amount of seconds as an argument and returns it neatly formatted as 00:00:00
  ![Screenshot 2025-01-25 203500](https://github.com/user-attachments/assets/133b8977-ae8f-44c5-af74-dba4593cbbf7)

- A fade function that takes a progress var from 0-1 to fade out - if you want to fade in instead just use fade(1-progress)
  ![board_adventure_1](https://github.com/user-attachments/assets/45a2f711-89a5-4279-bb2c-4509094c72ce)

