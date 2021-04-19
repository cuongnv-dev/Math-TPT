// import 'package:flutter/material.dart';
// import 'package:math/common/constants/size_constants.dart';
// import 'package:math/common/screenutil/screenutil.dart';
// import '../../common/extensions/size_extensions.dart';

// enum BorderType { enabled, focus, correct, wrong }

// class InputNumberWidget extends StatelessWidget {
//   final BorderType borderType;
//   final TextEditingController controller;
//   final Function onPress;
//   final bool enable;

//   const InputNumberWidget({
//     Key key,
//     @required this.borderType,
//     @required this.controller,
//     @required this.onPress,
//     @required this.enable,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: (ScreenUtil.screenWidth - Sizes.padding_horizontal * 2) / 6,
//       height: (ScreenUtil.screenWidth - Sizes.padding_horizontal * 2) / 6,
//       child: TextField(
//         enabled: enable,
//         cursorColor: Colors.transparent,
//         cursorWidth: 0,
//         controller: controller,
//         keyboardType: TextInputType.number,
//         textAlign: TextAlign.center,
//         textAlignVertical: TextAlignVertical.center,
//         style: TextStyle(fontSize: Sizes.dimen_36.sp, height: 1.2),
//         decoration: new InputDecoration(
//           border: OutlineInputBorder(
//               borderSide: new BorderSide(color: Colors.red, width: 5)),
//           focusedBorder: OutlineInputBorder(
//               borderSide: new BorderSide(color: Colors.lightBlue, width: 3)),
//           enabledBorder: OutlineInputBorder(
//             borderSide: new BorderSide(
//                 color: borderType == BorderType.enabled
//                     ? Colors.grey[400]
//                     : (borderType == BorderType.correct
//                         ? Colors.greenAccent
//                         : Colors.redAccent),
//                 width: 3),
//           ),
//           errorBorder: InputBorder.none,
//           disabledBorder: OutlineInputBorder(
//             borderSide: new BorderSide(
//               color: Colors.grey[400],
//               width: 3,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:math/common/constants/size_constants.dart';
import 'package:math/common/screenutil/screenutil.dart';
import '../../common/extensions/size_extensions.dart';

enum BorderType { enabled, focus, correct, wrong }

class InputNumberWidget extends StatelessWidget {
  final BorderType borderType;
  final String initialValue;
  final bool enable;
  final Function onChanged;

  const InputNumberWidget({
    Key key,
    @required this.borderType,
    @required this.initialValue,
    @required this.enable,
    @required this.onChanged,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: (ScreenUtil.screenWidth - Sizes.padding_horizontal * 2) / 6,
      height: (ScreenUtil.screenWidth - Sizes.padding_horizontal * 2) / 6,
      child: TextFormField(
        enabled: enable,
        cursorColor: Colors.transparent,
        cursorWidth: 0,
        initialValue: initialValue,
        onChanged: (value) {
          onChanged();
        },
        // controller: controller,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(fontSize: Sizes.dimen_36.sp, height: 1.2),
        decoration: new InputDecoration(
          border: OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.red, width: 5)),
          focusedBorder: OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.lightBlue, width: 3)),
          enabledBorder: OutlineInputBorder(
            borderSide: new BorderSide(
                color: borderType == BorderType.enabled
                    ? Colors.grey[400]
                    : (borderType == BorderType.correct
                        ? Colors.greenAccent
                        : Colors.redAccent),
                width: 3),
          ),
          errorBorder: InputBorder.none,
          disabledBorder: OutlineInputBorder(
            borderSide: new BorderSide(
              color: Colors.grey[400],
              width: 3,
            ),
          ),
        ),
      ),
    );
  }
}
