import 'package:flutter/material.dart';

class ObjectMockup {
  final String image;
  final String background;

  ObjectMockup({@required this.image, @required this.background})
      : assert(image != "", 'image cannot be null'),
        assert(background != "", 'background cannot be null');
}
