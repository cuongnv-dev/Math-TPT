import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:math/common/constants/size_constants.dart';
import '../../common/extensions/size_extensions.dart';
import '../themes/theme_text.dart';

class MenuButtonWidget extends StatelessWidget {
  final String title;
  final String iconPath;
  final Color outsideColor;
  final Color insideColor;
  final Function onPressed;

  const MenuButtonWidget({
    Key key,
    @required this.title,
    @required this.iconPath,
    @required this.outsideColor,
    @required this.insideColor,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: <Widget>[
          Stack(
            children: [
              Container(
                width: Sizes.dimen_120,
                height: Sizes.dimen_120,
                decoration: BoxDecoration(
                  color: outsideColor,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              Container(
                width: Sizes.dimen_120,
                height: Sizes.dimen_110,
                decoration: BoxDecoration(
                  color: insideColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.all(Sizes.dimen_18.w),
                child: SvgPicture.asset(
                  iconPath,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(
            height: Sizes.dimen_4.h,
          ),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .boldHeadline5
                .copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }
}
