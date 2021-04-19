import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild.unfocus();
        }
        Get.back();
      },
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
            padding: EdgeInsets.all(10),
            child: SvgPicture.asset(
              'assets/svg/arrow-left.svg',
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
