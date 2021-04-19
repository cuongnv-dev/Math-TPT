import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../common/constants/size_constants.dart';
import '../themes/theme_text.dart';

import '../../common/extensions/size_extensions.dart';
import 'back_button_widget.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarWidget({Key key, @required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      title: Row(
        children: [
          BackButtonWidget(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(Sizes.dimen_22.h);
}
