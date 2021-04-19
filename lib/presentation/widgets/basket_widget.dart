import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:math/data/mock/object_constant.dart';

class BasketWiget extends StatelessWidget {
  final String text;
  final String svg;

  const BasketWiget({Key key, this.text, this.svg}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print('parent svg $svg');
    return Stack(
      children: [
        SvgPicture.asset(
          svg != null ? svg : ObjectConstant.divisionList[0].image,
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
