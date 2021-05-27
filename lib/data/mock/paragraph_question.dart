import 'package:flutter/material.dart';

class ParagraphQuestion {
  final String title;
  final String subTitle;
  final String unit;
  final dynamic image;
  final List<int> nums;
  final bool excep;
  final String note;

  ParagraphQuestion({
    @required this.title,
    @required this.subTitle,
    @required this.unit,
    @required this.image,
    this.nums,
    this.excep,
    this.note,
  })  : assert(title != "", 'title cannot be null'),
        assert(subTitle != "", 'subTitle cannot be null'),
        assert(unit != "", 'unit cannot be null'),
        assert(image != "", 'image cannot be null');
}
