import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:math/common/constants/size_constants.dart';
import 'package:math/common/routes/routers.dart';
import 'package:math/common/screenutil/screenutil.dart';
import 'package:math/data/mock/object_constant.dart';
import 'package:math/presentation/controller/compare_choice_exe_controller.dart';
import 'package:math/presentation/controller/plus_choice_number_exe_controller.dart';
import 'package:math/presentation/widgets/back_button_widget.dart';
import 'package:math/presentation/widgets/basket_widget.dart';
import 'package:math/presentation/widgets/custom_container_widget.dart';
import 'package:math/presentation/widgets/guide_button_widget.dart';
import 'package:math/presentation/widgets/large_number_widget.dart';
import 'package:math/presentation/widgets/result_screen.dart';
import '../../../common/extensions/size_extensions.dart';
import '../../themes/theme_text.dart';

//Todo: add single child scroll view
class CompareChoiceAnswerScreen extends StatelessWidget {
  void playSound(String sound) {
    final player = AudioCache();
    player.play(sound);
  }

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
            child: GetBuilder<CompareChoiceExeController>(
              init: CompareChoiceExeController(),
              builder: (_) {
                String svgUrl = (_.num1.value > 14 || _.num2.value > 14)
                    ? ObjectConstant.fruits[5]
                    : ObjectConstant.seaAnimals[_.object.value];
                return Obx(
                  () => Column(
                    children: <Widget>[
                      SizedBox(
                        height: ScreenUtil.statusBarHeight,
                      ),
                      Text(
                        _.type.value == 'smaller'
                            ? 'Chọn số bé hơn'
                            : 'Chọn số lớn  hơn',
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
                          GuideButtonWidget(),
                        ],
                      ),
                      SizedBox(
                        height: Sizes.padding_vertical.h * 3,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                _.answerList[0] < 12
                                    ? Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                              color: Colors.grey[200]),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.8),
                                              blurRadius: 8,
                                              offset: Offset(1, 1),
                                            ),
                                          ],
                                        ),
                                        padding: EdgeInsets.all(10),
                                        child: Wrap(
                                          children: [
                                            for (var j = 0;
                                                j < _.answerList[0];
                                                j++)
                                              Padding(
                                                padding: EdgeInsets.all(3.0),
                                                child: SvgPicture.asset(
                                                  svgUrl,
                                                  height: 35,
                                                ),
                                              ),
                                          ],
                                        ))
                                    : LargeNumWidget(
                                        count: _.answerList[0],
                                        svgUrl: ObjectConstant
                                            .objList[_.object.value].image,
                                        parentSvg: ObjectConstant
                                            .objList[_.object.value].background,
                                      ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                _.answerList[1] < 12
                                    ? Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                              color: Colors.grey[200]),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.8),
                                              blurRadius: 8,
                                              offset: Offset(1, 1),
                                            ),
                                          ],
                                        ),
                                        padding: EdgeInsets.all(10),
                                        child: Wrap(
                                          children: [
                                            for (var j = 0;
                                                j < _.answerList[1];
                                                j++)
                                              Padding(
                                                padding: EdgeInsets.all(3.0),
                                                child: SvgPicture.asset(
                                                  svgUrl,
                                                  height: 35,
                                                ),
                                              ),
                                          ],
                                        ))
                                    : LargeNumWidget(
                                        count: _.answerList[1],
                                        svgUrl: ObjectConstant
                                            .objList[_.object.value].image,
                                        parentSvg: ObjectConstant
                                            .objList[_.object.value].background,
                                      ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            for (var i = 0; i < 2; i++)
                              !_.showResult.value
                                  ? Stack(
                                      fit: StackFit.passthrough,
                                      children: <Widget>[
                                        CustomContainer(
                                          childWidget: Center(
                                            child: Text('${_.answerList[i]}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .whiteBoldHeadline3),
                                          ),
                                          outsideHeight: 80,
                                          insideHeight: 73,
                                          width: Sizes.dimen_80.w,
                                          outsideColor: Colors.lightBlue[800],
                                          insideColor: Colors.lightBlue[400],
                                          borderRadius: 30,
                                          onTap: () {
                                            String sound =
                                                _.correctIndex.value == i
                                                    ? 'correct.mp3'
                                                    : 'incorrect.mp3';
                                            playSound(sound);
                                            if (!_.next.value) {
                                              _.submitAnswer(i);
                                            }
                                            ;
                                          },
                                        ),
                                      ],
                                    )
                                  : Stack(
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
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .whiteBoldHeadline3),
                                            ),
                                            outsideHeight: 80,
                                            insideHeight: 73,
                                            width: Sizes.dimen_80.w,
                                            outsideColor:
                                                _.selectedIndex.value == i
                                                    ? (_.correctIndex.value == i
                                                        ? Colors.lightGreen[800]
                                                        : Colors.red[800])
                                                    : Colors.lightBlue[800],
                                            insideColor:
                                                _.selectedIndex.value == i
                                                    ? (_.correctIndex.value == i
                                                        ? Colors.lightGreen[400]
                                                        : Colors.red[400])
                                                    : Colors.lightBlue[400],
                                            borderRadius: 30,
                                            onTap: () {
                                              if (!_.next.value) {
                                                String sound =
                                                    _.correctIndex.value == i
                                                        ? 'correct.mp3'
                                                        : 'incorrect.mp3';
                                                playSound(sound);
                                                _.submitAnswer(i);
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Sizes.dimen_10.h,
                      ),
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
                                        named: Routers.compareChoice,
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
}
