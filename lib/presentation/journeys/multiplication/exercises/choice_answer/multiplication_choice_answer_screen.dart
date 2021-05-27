import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:math/common/constants/size_constants.dart';
import 'package:math/common/routes/routers.dart';
import 'package:math/common/screenutil/screenutil.dart';
import 'package:math/data/mock/object_constant.dart';
import 'package:math/presentation/controller/multiplication_choice_number_exe_controller.dart';
import 'package:math/presentation/journeys/user_manual/orther_guide.dart';
import 'package:math/presentation/widgets/back_button_widget.dart';
import 'package:math/presentation/widgets/custom_container_widget.dart';
import 'package:math/presentation/widgets/guide_button_widget.dart';
import 'package:math/presentation/widgets/result_screen.dart';
import '../../../../../common/extensions/size_extensions.dart';
import '../../../../themes/theme_text.dart';

class MultiplicationChoiceAnswerScreen extends StatelessWidget {
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
              bottom: Sizes.padding_vertical.h,
              right: Sizes.padding_horizontal.w,
              left: Sizes.padding_horizontal.w,
            ),
            color: Colors.black.withOpacity(0.5),
            child: GetBuilder<MultiplicationChoiceNumberExerciseController>(
              init: MultiplicationChoiceNumberExerciseController(),
              builder: (_) {
                return Obx(
                  () => Column(
                    children: [
                      SizedBox(
                        height: ScreenUtil.statusBarHeight,
                      ),
                      Text(
                        'Chọn đáp án đúng',
                        style: Theme.of(context).textTheme.whiteSubtitle2,
                      ),
                      SizedBox(height: Sizes.padding_vertical.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          BackButtonWidget(),
                          CustomContainer(
                            childWidget: Center(
                              child: Text(
                                '${_.questionCount.value}/10',
                                style: Theme.of(context)
                                    .textTheme
                                    .whiteBoldHeadline5,
                              ),
                            ),
                            outsideHeight: 55,
                            insideHeight: 50,
                            width: Sizes.dimen_100.w,
                            outsideColor: Colors.lightBlue[800],
                            insideColor: Colors.lightBlue[400],
                            borderRadius: 25,
                            onTap: () {},
                          ),
                           GuideButtonWidget(onTap: () {
                            Get.to(OtherGuide());
                          }),
                        ],
                      ),
                      SizedBox(
                        height: Sizes.padding_horizontal.h,
                      ),
                      Wrap(
                        children: [
                          for (var i = 0; i < _.question.value; i++)
                            Padding(
                              padding: EdgeInsets.all(3),
                              child: Container(
                                width: (ScreenUtil.screenWidth -
                                        Sizes.padding_horizontal.w * 2 -
                                        20) /
                                    3,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.grey[200]),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.8),
                                      blurRadius: 8,
                                      offset: Offset(1, 1),
                                    ),
                                  ],
                                ),
                                padding: EdgeInsets.all(3),
                                child: Center(
                                  child: Wrap(
                                    children: [
                                      for (var j = 0;
                                          j < Get.arguments['type'];
                                          j++)
                                        Padding(
                                          padding: EdgeInsets.all(2.0),
                                          child: SvgPicture.asset(
                                              ObjectConstant
                                                  .seaAnimals[_.object.value],
                                              height: Get.arguments['type'] > 2
                                                  ? 30
                                                  : 40),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      SizedBox(height: Sizes.padding_vertical.h),
                      Text(
                        '${Get.arguments['type']} x ${_.question.value}  = ?',
                        style: Theme.of(context)
                            .textTheme
                            .whiteBoldHeadline3
                            .copyWith(height: 1),
                      ),
                      Spacer(),
                      Get.arguments['type'] < 5
                          ? (_.next.value
                              ? Image.asset('assets/animation/tenor_clap.gif',
                                  height: 80)
                              : (_.showResult.value
                                  ? Image.asset('assets/animation/tenor.gif',
                                      height: 80)
                                  : Container()))
                          : Container(),
                      newMethod(_, context),
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
                                        named:
                                            Routers.multiplicationChoiceAnsEx,
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

  Obx newMethod(
      MultiplicationChoiceNumberExerciseController _, BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          for (var i = 0; i < 3; i++)
            !_.showResult.value
                ? Stack(
                    fit: StackFit.passthrough,
                    children: <Widget>[
                      CustomContainer(
                        childWidget: Center(
                          child: Text(
                            '${_.answerList[i]}',
                            style:
                                Theme.of(context).textTheme.whiteBoldHeadline3,
                          ),
                        ),
                        outsideHeight: 80,
                        insideHeight: 73,
                        width: Sizes.dimen_80.w,
                        outsideColor: Colors.lightBlue[800],
                        insideColor: Colors.lightBlue[400],
                        borderRadius: 30,
                        onTap: () {
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
                      Container(
                        margin: EdgeInsets.only(top: 70),
                        child: CustomContainer(
                          childWidget: Center(
                            child: Text(
                              '${_.answerList[i]}',
                              style: Theme.of(context)
                                  .textTheme
                                  .whiteBoldHeadline3,
                            ),
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
                  ),
        ],
      ),
    );
  }
}
