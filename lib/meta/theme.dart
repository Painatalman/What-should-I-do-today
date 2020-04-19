import 'package:flutter/material.dart' show Color, ImageProvider, NetworkImage, Text;
import 'package:its_flutter/meta/palette.dart' show Palette;

class Theme {
  static Color mainColor = Palette.blueSky;
  static Color altColor = Palette.blueSkyLight;

  static ImageProvider defaultImage = NetworkImage('https://placekitten.com/120/120');

  static Text defaultPreloaderText = Text('Loading...');
}
