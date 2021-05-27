import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:math/presentation/widgets/basket_widget.dart';

class LargeNumWidget extends StatelessWidget {
  const LargeNumWidget({
    Key key,
    @required this.count,
    @required this.svgUrl,
    this.hide,
    this.parentSvg,
  }) : super(key: key);

  final int count;
  final String svgUrl;
  final bool hide;
  final String parentSvg;

  @override
  Widget build(BuildContext context) {
    int basketCount = (count / 10).floor();
    int smCount = count - (basketCount * 10);
    return Container(
        decoration: hide == null
            ? BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey[200]),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.8),
                    blurRadius: 8,
                    offset: Offset(1, 1),
                  ),
                ],
              )
            : BoxDecoration(),
        padding: EdgeInsets.all(5),
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            for (var i = 0; i < basketCount; i++)
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: BasketWiget(svg: parentSvg, text: '10'),
              ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Wrap(
                children: [
                  for (var i = 0; i < smCount; i++)
                    Padding(
                      padding: EdgeInsets.all(3.0),
                      child: SvgPicture.asset(
                        svgUrl,
                        height: 25,
                      ),
                    ),
                ],
              ),
            )
          ],
        ));
  }
}
