import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:math/common/constants/size_constants.dart';
import 'package:math/presentation/widgets/app_bar_widget.dart';
import '../../common/extensions/size_extensions.dart';
import '../themes/theme_text.dart';

class SubMenuButtonWidget extends StatelessWidget {
  final String title;
  final Color outsideColor;
  final Color insideColor;
  final Function onPressed;
  final bool selected;

  const SubMenuButtonWidget({
    Key key,
    @required this.title,
    @required this.outsideColor,
    @required this.insideColor,
    @required this.onPressed,
    this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: Sizes.dimen_10.h,
              left: Sizes.dimen_24.w,
              right: Sizes.dimen_24.w,
            ),
            width: double.infinity,
            height: 27.h,
            decoration: BoxDecoration(
              color: selected ? Colors.green[700] : outsideColor,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: Sizes.dimen_10.h,
              left: Sizes.dimen_24.w,
              right: Sizes.dimen_24.w,
            ),
            width: double.infinity,
            height: 24.h,
            decoration: BoxDecoration(
              color: selected ? Colors.green[400] : insideColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
                child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .whiteSubtitle2
                  .copyWith(fontWeight: FontWeight.w600),
              maxLines: 1,
            )),
          ),
          if (selected == true)
            Positioned(
              bottom: Sizes.dimen_10.h,
              child: SvgPicture.asset(
                'assets/svg/kitty.svg',
                height: Sizes.dimen_20.h,
              ),
            )
        ],
      ),
    );
  }
}
