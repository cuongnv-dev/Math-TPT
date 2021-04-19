import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:math/data/mock/object_constant.dart';

class MultiWidget extends StatelessWidget {
  final String text;
  final String svg;

  const MultiWidget({Key key, this.text, this.svg}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          svg,
          height: 60,
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 30,
              height: 18,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: Colors.white),
              child: Center(
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                        color: Colors.black,
                      ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
