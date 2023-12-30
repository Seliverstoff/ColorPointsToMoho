# ColorPointsToMoho (Automating curve coloring in Moho and Photoshop)

This set of scripts facilitates and automates the process of coloring curve points according to colors obtained from an image. The scripts are designed to be used in conjunction with the Moho animation program and the Photoshop graphics editor, working together to achieve accurate and efficient results.

## Peculiarities

- **Automatic coloring of curve points**: Curve points in Moho are colored in colors corresponding to the pixels of the source image at their coordinates.
- **Data exchange between programs**: Moho integration with Photoshop allows you to efficiently transfer color data, thanks to specialized scripts for import and export.
- **Temporary data storage**: Information about the color of the dots is temporarily stored in a text file, which makes it easier to exchange between programs.

## Included scripts

- **get_color.jsx for Photoshop**: Determines the colors in the image at the desired coordinates and saves the data for Moho.
- **points_vector.lua for Moho**: Imports point color data from a Photoshop script and applies it to curves.
- **vector_points.lua for Moho**: Exports the coordinates of curve points for further processing in Photoshop.

## Installation

1. Copy the `.lua` files to the Moho user scripts directory. As an example:
```
D:\MohoCustom\Moho Pro\Scripts\Menu\Text
```
After installing and restarting Moho, two new items for working with scripts will appear in the menu.

2. The `get_color.jsx` script for Photoshop does not require installation. Launch it directly through the Photoshop menu, after opening the image file.

## Important notes

- Make sure that the image dimensions in Moho and Photoshop are exactly the same before using scripts to correctly synchronize the color of the dots with the pixels of the image.

Use these scripts to speed up and simplify the process of coloring animations, saving time on creativity and avoiding monotonous work.
