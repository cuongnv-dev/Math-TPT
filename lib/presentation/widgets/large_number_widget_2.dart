import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:math/presentation/widgets/basket_widget.dart';
import 'package:math/presentation/widgets/multi_widget.dart';

class LargeNumWidget2 extends StatelessWidget {
  const LargeNumWidget2({
    Key key,
    @required this.count,
    @required this.svgUrl,
    @required this.parentSvg,
  }) : super(key: key);

  final int count;
  final String svgUrl;
  final String parentSvg;

  @override
  Widget build(BuildContext context) {
    int basketCount = (count / 10).floor();
    int smCount = count - (basketCount * 10);
    return Container(
        padding: EdgeInsets.all(5),
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            for (var i = 0; i < basketCount; i++)
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: MultiWidget(text: '10', svg: parentSvg),
              ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  for (var i = 0; i < smCount; i++)
                    Padding(
                      padding: EdgeInsets.all(3.0),
                      child: SvgPicture.asset(
                        svgUrl,
                        height: 30,
                      ),
                    ),
                ],
              ),
            )
          ],
        ));
  }
}
