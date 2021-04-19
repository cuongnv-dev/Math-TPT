import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:math/common/constants/size_constants.dart';
import 'package:math/common/routes/routers.dart';
import 'package:math/common/screenutil/screenutil.dart';
import 'package:math/data/mock/object_constant.dart';
import 'package:math/data/mock/paragraph_question.dart';
import 'package:math/data/mock/paragraph_question_constant.dart';
import 'package:math/presentation/controller/minus_paragraph_exe_controller.dart';

import 'package:math/presentation/controller/plus_paragraph_exe_controller.dart';
import 'package:math/presentation/widgets/back_button_widget.dart';
import 'package:math/presentation/widgets/custom_container_widget.dart';
import 'package:math/presentation/widgets/guide_button_widget.dart';
import 'package:math/presentation/widgets/large_number_widget.dart';
import 'package:math/presentation/widgets/large_number_widget_2.dart';
import 'package:math/presentation/widgets/result_screen.dart';
import '../../../../../common/extensions/size_extensions.dart';
import '../../../../themes/theme_text.dart';

class MinusParagraphExeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/png/ocean.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Colors.black.withOpacity(0.4),
          height: double.infinity,
          padding: EdgeInsets.only(
            left: Sizes.padding_horizontal.w,
            right: Sizes.padding_horizontal.w,
          ),
          child: GetBuilder<MinusParagraphExerciseController>(
            init: MinusParagraphExerciseController(),
            initState: (_) {},
            builder: (_) {
              ParagraphQuestion object =
                  ParagraphQuestionConstant.listMinus[_.question.value - 1];
              return Obx(
                () => SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Giải bài toán có lời văn',
                          style: Theme.of(context).textTheme.whiteSubtitle2,
                        ),
                        SizedBox(height: Sizes.padding_vertical.h),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Sizes.padding_horizontal.w,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              BackButtonWidget(),
                              Obx(
                                () => CustomContainer(
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
                              ),
                              GuideButtonWidget(),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Sizes.padding_vertical.h * 3,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey[200]),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.6),
                                blurRadius: 8,
                                offset: Offset(1, 1),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Text(
                                ParagraphQuestionConstant
                                    .listMinus[_.question.value - 1].title,
                                style:
                                    Theme.of(context).textTheme.whiteSubtitle1,
                              ),
                              SizedBox(height: Sizes.padding_vertical.h),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Get.arguments['type'] == 'SM'
                                        ? Wrap(
                                            alignment: WrapAlignment.center,
                                            children: [
                                              for (var j = 0;
                                                  j < object.nums[0];
                                                  j++)
                                                Padding(
                                                  padding: EdgeInsets.all(3.0),
                                                  child: SvgPicture.asset(
                                                      object.image[0],
                                                      height: 40),
                                                ),
                                            ],
                                          )
                                        : (object.nums[0] == 10
                                            ? Wrap(
                                                alignment: WrapAlignment.center,
                                                children: [
                                                  for (var j = 0;
                                                      j < object.nums[0];
                                                      j++)
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(3.0),
                                                      child: SvgPicture.asset(
                                                        object.image[1],
                                                        height: 40,
                                                      ),
                                                    ),
                                                ],
                                              )
                                            : LargeNumWidget2(
                                                count: object.nums[0],
                                                svgUrl: object.image[1],
                                                parentSvg: object.image[0],
                                              )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SvgPicture.asset(
                                      'assets/svg/minus.svg',
                                      color: Colors.white,
                                      height: 20,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Get.arguments['type'] == 'SM'
                                        ? Wrap(
                                            alignment: WrapAlignment.center,
                                            children: [
                                              for (var j = 0;
                                                  j < object.nums[1];
                                                  j++)
                                                Padding(
                                                  padding: EdgeInsets.all(3.0),
                                                  child: SvgPicture.asset(
                                                    object.image[1],
                                                    height: 40,
                                                  ),
                                                ),
                                            ],
                                          )
                                        : (object.nums[1] == 10
                                            ? Wrap(
                                                alignment: WrapAlignment.center,
                                                children: [
                                                  for (var j = 0;
                                                      j < object.nums[1];
                                                      j++)
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(3.0),
                                                      child: SvgPicture.asset(
                                                        object.image[1],
                                                        height: 30,
                                                      ),
                                                    ),
                                                ],
                                              )
                                            : LargeNumWidget2(
                                                count: object.nums[1],
                                                svgUrl: object.image[1],
                                                parentSvg: object.image[0],
                                              )),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Sizes.padding_vertical.h * 2,
                        ),
                        Text(
                          'Giải:',
                          style: Theme.of(context).textTheme.whiteSubtitle1,
                        ),
                        Text(
                          ParagraphQuestionConstant
                              .listMinus[_.question.value - 1].subTitle,
                          style: Theme.of(context)
                              .textTheme
                              .whiteSubtitle1
                              .copyWith(
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                        SizedBox(height: Sizes.padding_vertical.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: Sizes.padding_horizontal.w,
                            ),
                            buildNumber(_, context, 0),
                            Text(
                              '-',
                              style: Theme.of(context)
                                  .textTheme
                                  .boldSubtitle1
                                  .copyWith(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                  ),
                            ),
                            buildNumber(_, context, 1),
                            Text(
                              '=',
                              style: Theme.of(context)
                                  .textTheme
                                  .boldSubtitle1
                                  .copyWith(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                  ),
                            ),
                            buildNumber(_, context, 2),
                            Text(
                              "(${ParagraphQuestionConstant.listMinus[_.question.value - 1].unit})",
                              style: Theme.of(context)
                                  .textTheme
                                  .boldSubtitle1
                                  .copyWith(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                  ),
                            ),
                          ],
                        ),
                        SizedBox(height: Sizes.padding_vertical.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Đáp số:',
                              style: Theme.of(context)
                                  .textTheme
                                  .boldSubtitle1
                                  .copyWith(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white),
                            ),
                            buildNumber(_, context, 3),
                            Text(
                              ParagraphQuestionConstant
                                  .listMinus[_.question.value - 1].unit,
                              style: Theme.of(context)
                                  .textTheme
                                  .boldSubtitle1
                                  .copyWith(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(height: Sizes.padding_vertical.h * 3),
                        Wrap(
                          children: [
                            for (var i = 0; i < 10; i++)
                              buildSingleKey(i, context, _)
                          ],
                        ),
                        SizedBox(
                          height: Sizes.dimen_12.h,
                        ),
                        CustomContainer(
                          childWidget: Center(
                            child: Text(
                              _.next.value ? 'Tiếp tục' : 'Kiểm tra',
                              style: Theme.of(context).textTheme.whiteSubtitle1,
                            ),
                          ),
                          outsideHeight: 50,
                          insideHeight: 45,
                          width: Sizes.dimen_140.w,
                          outsideColor: Colors.orange[800],
                          insideColor: Colors.orange[400],
                          borderRadius: 25,
                          onTap: () {
                            _.next.value
                                ? _.questionCount.value == 10
                                    ? Get.off(ResultScreen(
                                        correctAnswers: 10,
                                        score: _.score.value,
                                        showAnswerCount: false,
                                        named: Routers.minusChoiceParagraphEx,
                                        params: Get.arguments,
                                      ))
                                    : _.generateNewQuestion()
                                : _.checkResult();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Padding buildNumber(
      MinusParagraphExerciseController _, BuildContext context, int index) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: GestureDetector(
        onTap: !_.next.value && _.borderList[index] != 1
            ? () {
                _.inputOnTap(index);
              }
            : null,
        child: Align(
          alignment: Alignment.center,
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: _.borderList[index] == 0
                  ? Colors.yellow
                  : (_.borderList[index] == 1
                      ? Colors.lightGreen
                      : (_.borderList[index] == 2
                          ? Colors.red[400]
                          : Colors.white)),
            ),
            child: Center(
              child: Text(
                _.answerList[index] != 0 ? '${_.answerList[index]}' : '',
                style: Theme.of(context).textTheme.headline6.copyWith(
                      color:
                          (_.borderList[index] == 1 || _.borderList[index] == 2)
                              ? Colors.white
                              : Colors.black,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding buildSingleKey(
    int i,
    BuildContext context,
    MinusParagraphExerciseController _,
  ) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Material(
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          customBorder: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(15),
          highlightColor: Colors.lightBlue,
          onTap: (_.borderList.indexOf(0) != -1 &&
                  _.answerList[_.borderList.indexOf(0)].toString().length < 2)
              ? () {
                  _.keyBoardOnTap(i, _.borderList.indexOf(0));
                }
              : null,
          child: Container(
            width:
                (ScreenUtil.screenWidth - Sizes.padding_horizontal.w * 2 - 80) /
                    6,
            height:
                (ScreenUtil.screenWidth - Sizes.padding_horizontal.w * 2 - 80) /
                    6,
            child: Center(
              child: Text(
                '$i',
                style: Theme.of(context).textTheme.boldHeadline5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
