import 'package:flutter/material.dart';
import 'package:math/presentation/journeys/plus/exercises/plus_choice_number_excersise.dart';
import 'package:get/get.dart';
import 'package:math/common/constants/size_constants.dart';
import 'package:math/common/screenutil/screenutil.dart';
import 'package:math/presentation/widgets/back_button_widget.dart';
import 'package:math/presentation/widgets/custom_container_widget.dart';
import '../../../common/extensions/size_extensions.dart';
import '../../themes/theme_text.dart';

class PlusCategoryScreen extends StatelessWidget {
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
                height: Sizes.padding_vertical.h * 2,
              ),
              CustomContainer(
                childWidget: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Phạm vi 10',
                      style: Theme.of(context)
                          .textTheme
                          .whiteBoldHeadline5
                          .copyWith(height: 0.7),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                outsideHeight: 150,
                insideHeight: 135,
                width: ScreenUtil.screenWidth / 1.8,
                outsideColor: Colors.purple[800],
                insideColor: Colors.purple[400],
                borderRadius: 40,
                onTap: () {
                  Get.to(PlusChoiceNumberExcercises(
                    type: 'small',
                  ));
                },
              ),
              SizedBox(height: Sizes.padding_vertical.h * 4),
              CustomContainer(
                childWidget: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Phạm vi 100',
                      style: Theme.of(context)
                          .textTheme
                          .whiteBoldHeadline5
                          .copyWith(height: 0.8),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                outsideHeight: 150,
                insideHeight: 135,
                width: ScreenUtil.screenWidth / 1.8,
                outsideColor: Colors.green[800],
                insideColor: Colors.green[400],
                borderRadius: 40,
                onTap: () {
                  Get.to(PlusChoiceNumberExcercises(
                    type: 'large',
                  ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
