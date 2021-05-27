import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:math/common/constants/size_constants.dart';
import 'package:math/common/routes/routers.dart';
import 'package:math/common/screenutil/screenutil.dart';
import 'package:math/data/mock/object_constant.dart';
import 'package:math/presentation/controller/compare_best_exe_controller.dart';
import 'package:math/presentation/controller/compare_choice_exe_controller.dart';
import 'package:math/presentation/controller/plus_choice_number_exe_controller.dart';
import 'package:math/presentation/journeys/user_manual/campare_guide.dart';
import 'package:math/presentation/widgets/back_button_widget.dart';
import 'package:math/presentation/widgets/custom_container_widget.dart';
import 'package:math/presentation/widgets/guide_button_widget.dart';
import 'package:math/presentation/widgets/large_number_widget.dart';
import 'package:math/presentation/widgets/result_screen.dart';
import '../../../common/extensions/size_extensions.dart';
import '../../themes/theme_text.dart';

//Todo: add single child scroll view
class CompareBestAnswerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/png/ocean.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: double.infinity,
            padding: EdgeInsets.only(
                left: Sizes.padding_horizontal.w,
                right: Sizes.padding_horizontal.w,
                bottom: Sizes.padding_vertical.h),
            color: Colors.black.withOpacity(0.5),
            child: GetBuilder<CompareBestExeController>(
              init: CompareBestExeController(),
              builder: (_) {
                String svgUrl = ObjectConstant.fruits[_.object.value];
                return Obx(
                  () => Column(
                    children: <Widget>[
                      SizedBox(
                        height: ScreenUtil.statusBarHeight,
                      ),
                      _.questionCount.value < 6
                          ? Text(
                              'Chọn số lớn nhất',
                              style: Theme.of(context).textTheme.whiteSubtitle2,
                            )
                          : Text(
                              'Chọn số bé nhất',
                              style: Theme.of(context).textTheme.whiteSubtitle2,
                            ),
                      SizedBox(height: Sizes.padding_vertical.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          BackButtonWidget(),
                          CustomContainer(
                            childWidget: Center(
                              child: Text('${_.questionCount.value}/10',
                                  style: Theme.of(context)
                                      .textTheme
                                      .whiteBoldHeadline6),
                            ),
                            outsideHeight: 50,
                            insideHeight: 45,
                            width: Sizes.dimen_100.w,
                            outsideColor: Colors.lightBlue[800],
                            insideColor: Colors.lightBlue[400],
                            borderRadius: 25,
                            onTap: () {},
                          ),
                          GuideButtonWidget(onTap: () {
                            Get.to(CompareGuide());
                          }),
                        ],
                      ),
                      SizedBox(
                        height: Sizes.padding_vertical.h * 3,
                      ),
                      for (var i = 0; i < 3; i++)
                        Column(
                          children: [
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 5,
                                  child: _.answerList[i] < 11
                                      ? ConstrainedBox(
                                          constraints: new BoxConstraints(
                                            minHeight: Sizes.dimen_40.h,
                                          ),
                                          child: Container(
                                            padding: EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.5),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: Colors.grey[200]),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.07),
                                                  blurRadius: 8,
                                                  offset: Offset(1, 1),
                                                ),
                                              ],
                                            ),
                                            child: Center(
                                              child: Wrap(
                                                children: [
                                                  for (var j = 0;
                                                      j < _.answerList[i];
                                                      j++)
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(3.0),
                                                      child: SvgPicture.asset(
                                                        svgUrl,
                                                        height: 35,
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      : LargeNumWidget(
                                          count: _.answerList[i],
                                          svgUrl: ObjectConstant
                                              .objList[_.object.value].image,
                                          parentSvg: ObjectConstant
                                              .objList[_.object.value]
                                              .background,
                                        ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Center(
                                    child: buildUnselectedWidget(_, i, context),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: Sizes.padding_vertical.h),
                          ],
                        ),
                      Spacer(),
                      _.next.value
                          ? Center(
                              child: CustomContainer(
                                childWidget: Center(
                                  child: _.questionCount.value == 10
                                      ? Text(
                                          'Xem điểm',
                                          style: Theme.of(context)
                                              .textTheme
                                              .whiteSubtitle1
                                              .copyWith(),
                                        )
                                      : SvgPicture.asset(
                                          'assets/svg/arrow-right.svg',
                                          color: Colors.white,
                                          height: 30,
                                        ),
                                ),
                                outsideHeight: 50,
                                insideHeight: 45,
                                width: Sizes.dimen_120.w,
                                outsideColor: Colors.orange[800],
                                insideColor: Colors.orange[400],
                                borderRadius: 25,
                                padding: EdgeInsets.all(Sizes.dimen_8.w),
                                onTap: () {
                                  if (_.questionCount.value < 10) {
                                    _.generateNewQuestion();
                                  } else {
                                    Get.off(
                                      ResultScreen(
                                        correctAnswers: _.rightAnswer.value,
                                        score: _.score.value,
                                        showAnswerCount: false,
                                        named: Routers.compareBest,
                                        params: Get.arguments,
                                      ),
                                    );
                                  }
                                },
                              ),
                            )
                          : Container(),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Stack buildSelectedWidget(
      CompareBestExeController _, int i, BuildContext context) {
    return Stack(
      children: <Widget>[
        _.selectedIndex.value == i
            ? Positioned(
                bottom: 60,
                child: SvgPicture.asset(
                  _.correctIndex.value != i
                      ? 'assets/svg/kitty-cry.svg'
                      : 'assets/svg/kitty-win.svg',
                  width: Sizes.dimen_80.w,
                ),
              )
            : Container(),
        Container(
          margin: EdgeInsets.only(top: 70),
          child: CustomContainer(
            childWidget: Center(
              child: Text('${_.answerList[i]}',
                  style: Theme.of(context).textTheme.whiteBoldHeadline3),
            ),
            outsideHeight: 80,
            insideHeight: 73,
            width: Sizes.dimen_80.w,
            outsideColor: _.selectedIndex.value == i
                ? (_.correctIndex.value == i
                    ? Colors.lightGreen[800]
                    : Colors.red[800])
                : Colors.lightBlue[800],
            insideColor: _.selectedIndex.value == i
                ? (_.correctIndex.value == i
                    ? Colors.lightGreen[400]
                    : Colors.red[400])
                : Colors.lightBlue[400],
            borderRadius: 30,
            onTap: () {
              if (!_.next.value) {
                _.submitAnswer(i);
              }
            },
          ),
        ),
      ],
    );
  }

  Stack buildUnselectedWidget(
      CompareBestExeController _, int i, BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: <Widget>[
        CustomContainer(
          childWidget: Center(
            child: Text('${_.answerList[i]}',
                style: Theme.of(context).textTheme.whiteBoldHeadline3),
          ),
          outsideHeight: 80,
          insideHeight: 73,
          width: Sizes.dimen_80.w,
          outsideColor: _.showResult.value
              ? (_.selectedIndex.value == i
                  ? (_.correctIndex.value == i
                      ? Colors.lightGreen[800]
                      : Colors.red[800])
                  : Colors.lightBlue[800])
              : Colors.lightBlue[800],
          insideColor: _.showResult.value
              ? (_.selectedIndex.value == i
                  ? (_.correctIndex.value == i
                      ? Colors.lightGreen[400]
                      : Colors.red[400])
                  : Colors.lightBlue[400])
              : Colors.lightBlue[400],
          borderRadius: 30,
          onTap: () {
            if (!_.next.value) {
              print('abc');
              _.submitAnswer(i);
            }
            ;
          },
        ),
      ],
    );
  }
}
