import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math/presentation/controller/plus_category_controller.dart';
import 'package:get/get.dart';
import 'package:math/common/constants/size_constants.dart';
import 'package:math/common/routes/routers.dart';
import 'package:math/common/screenutil/screenutil.dart';
import 'package:math/presentation/widgets/back_button_widget.dart';
import 'package:math/presentation/widgets/sub_menu_button_widget.dart';
import '../../../../common/extensions/size_extensions.dart';

class PlusChoiceNumberExcercises extends StatefulWidget {
  final String type;

  const PlusChoiceNumberExcercises({Key key, @required this.type})
      : super(key: key);

  @override
  _PlusChoiceNumberExcercisesState createState() =>
      _PlusChoiceNumberExcercisesState();
}

class _PlusChoiceNumberExcercisesState
    extends State<PlusChoiceNumberExcercises> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    print('aaaaaaaa ${widget.type}');
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/png/home3.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Colors.black.withOpacity(0.6),
          child: Column(
            children: [
              SizedBox(
                height: ScreenUtil.statusBarHeight,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: Sizes.padding_vertical.h,
                    horizontal: Sizes.padding_horizontal.w,
                  ),
                  child: BackButtonWidget(),
                ),
              ),
              SizedBox(
                height: Sizes.padding_vertical.h,
              ),
              SubMenuButtonWidget(
                title: 'Chọn đáp án đúng',
                outsideColor: Colors.lightBlue[700],
                insideColor: Colors.lightBlue[400],
                onPressed: () {
                  setState(() {
                    selectedIndex = 0;
                  });
                },
                selected: selectedIndex == 0,
              ),
              SizedBox(height: Sizes.padding_vertical.h),
              SubMenuButtonWidget(
                title: 'Chọn phép tính đúng',
                outsideColor: Colors.lightBlue[700],
                insideColor: Colors.lightBlue[400],
                onPressed: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                },
                selected: selectedIndex == 1,
              ),
              SizedBox(height: Sizes.padding_vertical.h),
              SubMenuButtonWidget(
                title: 'Viết phép tính',
                outsideColor: Colors.lightBlue[700],
                insideColor: Colors.lightBlue[400],
                onPressed: () {
                  setState(() {
                    selectedIndex = 2;
                  });
                },
                selected: selectedIndex == 2,
              ),
              SizedBox(height: Sizes.padding_vertical.h),
              SubMenuButtonWidget(
                title: 'Giải toán có lời văn',
                outsideColor: Colors.lightBlue[700],
                insideColor: Colors.lightBlue[400],
                onPressed: () {
                  setState(() {
                    selectedIndex = 3;
                  });
                },
                selected: selectedIndex == 3,
              ),
              SizedBox(height: ScreenUtil.screenHeight * 0.1),
              GestureDetector(
                onTap: () {
                  switch (selectedIndex) {
                    case 0:
                      Get.toNamed(Routers.plusChoiceAnsEx, arguments: {
                        'type': widget.type == 'small' ? 'SM' : 'LG'
                      });

                      break;
                    case 2:
                      Get.toNamed(Routers.plusFillAnswerEx, arguments: {
                        'type': widget.type == 'small' ? 'SM' : 'LG'
                      });

                      break;
                    case 1:
                      Get.toNamed(Routers.plusDragImageEx, arguments: {
                        'type': widget.type == 'small' ? 'SM' : 'LG'
                      });
                      break;
                    case 3:
                      Get.toNamed(Routers.plusChoiceParagraphEx, arguments: {
                        'type': widget.type == 'small' ? 'SM' : 'LG'
                      });
                      break;
                    default:
                  }
                },
                child: Stack(
                  children: [
                    Container(
                      height: 50,
                      width: Sizes.dimen_150.w,
                      decoration: BoxDecoration(
                        color: Colors.orange[800],
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    Container(
                      height: 43,
                      width: Sizes.dimen_150.w,
                      decoration: BoxDecoration(
                        color: Colors.orange[400],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'Bắt đầu',
                          style: Theme.of(context).textTheme.headline2.copyWith(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
