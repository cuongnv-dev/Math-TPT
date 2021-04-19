import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math/common/constants/size_constants.dart';
import 'package:math/common/screenutil/screenutil.dart';
import 'package:math/presentation/widgets/back_button_widget.dart';
import 'package:math/presentation/widgets/custom_container_widget.dart';
import '../../../common/extensions/size_extensions.dart';
import '../../themes/theme_text.dart';
import 'exercises/multiplication_exe_category_screen.dart';

class MultiplicationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          padding: EdgeInsets.symmetric(
            vertical: Sizes.padding_vertical.h,
            horizontal: Sizes.padding_horizontal.w,
          ),
          child: Column(
            children: [
              SizedBox(
                height: ScreenUtil.statusBarHeight,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: BackButtonWidget(),
              ),
              SizedBox(
                height: ScreenUtil.screenHeight * 0.12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomContainer(
                    childWidget: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('x 2',
                                style: Theme.of(context)
                                    .textTheme
                                    .whiteBoldHeadline3
                                    .copyWith(fontSize: 60.sp)),
                          ],
                        ),
                      ),
                    ),
                    outsideHeight: 120,
                    insideHeight: 110,
                    width: 120,
                    outsideColor: Colors.purple[800],
                    insideColor: Colors.purple[400],
                    borderRadius: 30,
                    onTap: () {
                      Get.to(MultiplicationExeCategoryScreen(
                        type: 2,
                      ));
                    },
                  ),
                  CustomContainer(
                    childWidget: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('x 3',
                                style: Theme.of(context)
                                    .textTheme
                                    .whiteBoldHeadline3
                                    .copyWith(fontSize: 60.sp)),
                          ],
                        ),
                      ),
                    ),
                    outsideHeight: 120,
                    insideHeight: 110,
                    width: 120,
                    outsideColor: Colors.green[800],
                    insideColor: Colors.green[400],
                    borderRadius: 30,
                    onTap: () {
                      Get.to(MultiplicationExeCategoryScreen(
                        type: 3,
                      ));
                    },
                  ),
                ],
              ),
              SizedBox(height: Sizes.padding_vertical.h * 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomContainer(
                    childWidget: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('x 4',
                                style: Theme.of(context)
                                    .textTheme
                                    .whiteBoldHeadline3
                                    .copyWith(fontSize: 60.sp)),
                          ],
                        ),
                      ),
                    ),
                    outsideHeight: 120,
                    insideHeight: 110,
                    width: 120,
                    outsideColor: Colors.blue[800],
                    insideColor: Colors.blue[400],
                    borderRadius: 30,
                    onTap: () {
                      Get.to(MultiplicationExeCategoryScreen(
                        type: 4,
                      ));
                    },
                  ),
                  CustomContainer(
                    childWidget: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('x 5',
                                style: Theme.of(context)
                                    .textTheme
                                    .whiteBoldHeadline3
                                    .copyWith(fontSize: 60.sp)),
                          ],
                        ),
                      ),
                    ),
                    outsideHeight: 120,
                    insideHeight: 110,
                    width: 120,
                    outsideColor: Colors.orange[800],
                    insideColor: Colors.orange[400],
                    borderRadius: 30,
                    onTap: () {
                      Get.to(MultiplicationExeCategoryScreen(
                        type: 5,
                      ));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
