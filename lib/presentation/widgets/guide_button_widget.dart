import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class GuideButtonWidget extends StatelessWidget {
  final Function onTap;

  const GuideButtonWidget({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap != null ? onTap : null,
      child: Stack(
        children: [
          Container(
            width: 50,
            height: 52,
            decoration: BoxDecoration(
              color: Colors.orange[800],
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          Container(
            width: 50,
            height: 47,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.orange[400],
            ),
            padding: EdgeInsets.all(8),
            child: SvgPicture.asset(
              'assets/svg/question-mark.svg',
              color: Colors.white,
            ),
            // child: Text('?'),
          ),
        ],
      ),
    );
  }
}
