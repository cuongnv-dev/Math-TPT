import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:math/data/mock/object_constant.dart';

class BasketWigetLg extends StatelessWidget {
  final String text;

  const BasketWigetLg({Key key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          ObjectConstant.divisionList[0].image,
          height: 110,
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 45,
              height: 28,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: Colors.white),
              child: Center(
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.subtitle2.copyWith(
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
