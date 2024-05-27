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
- 
  ![Animated_sprite](https://github.com/taxicomics/Pico8-and-Picotron-Snippets/assets/168220579/0e5009d4-022b-4532-a1d7-534c9df49c3a)
- ChatGPT splurted out a **Terrain** function that I cleaned up a bit(lot). It smoothes random noise and generates nice terrains. I used it for my flooded caves clone, but maybe somebody else has a use for it, too. You can define it`s behavior in the last bit of the function, as an example I let it set pixel values on the sprite sheet. You could also set map tiles here. It is rather slow, but it can probably be enhanced by somebody smarter than me.

  ![terrain](https://github.com/taxicomics/Pico8-and-Picotron-Snippets/assets/168220579/6cab32f0-d802-4898-af49-63094a14ddc8)

