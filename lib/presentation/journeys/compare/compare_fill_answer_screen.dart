import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dotted_border/dotted_border.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math/common/constants/size_constants.dart';
import 'package:math/common/routes/routers.dart';
import 'package:math/common/screenutil/screenutil.dart';
import 'package:math/data/mock/object_constant.dart';
import 'package:math/presentation/controller/compare_fill_exe_controller%20copy.dart';
import 'package:math/presentation/journeys/user_manual/campare_guide.dart';
import 'package:math/presentation/widgets/back_button_widget.dart';
import 'package:math/presentation/widgets/custom_container_widget.dart';
import 'package:math/presentation/widgets/guide_button_widget.dart';
import 'package:math/presentation/widgets/large_number_widget.dart';
import 'package:math/presentation/widgets/result_screen.dart';
import '../../../common/extensions/size_extensions.dart';
import '../../themes/theme_text.dart';

class CompareFillAnswerScreen extends StatelessWidget {
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
              bottom: Sizes.padding_vertical.h,
            ),
            color: Colors.black.withOpacity(0.5),
            child: GetBuilder<CompareFillExeController>(
              init: CompareFillExeController(),
              builder: (_) {
                String svgUrl = (_.num1.value > 14 || _.num2.value > 14)
                    ? ObjectConstant.fruits[5]
                    : ObjectConstant.fruits[_.object.value];
                return Obx(
                  () => Column(
                    children: <Widget>[
                      SizedBox(
                        height: ScreenUtil.statusBarHeight,
                      ),
                      Text(
                        'Điền dấu >, <, =',
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
                                      .whiteBoldHeadline5),
                            ),
                            outsideHeight: 50,
                            insideHeight: 43,
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
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: _.num1.value < 12
                                ? Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(20),
                                      border:
                                          Border.all(color: Colors.grey[200]),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.8),
                                          blurRadius: 8,
                                          offset: Offset(1, 1),
                                        ),
                                      ],
                                    ),
                                    padding: EdgeInsets.all(3),
                                    child: Wrap(
                                      children: [
                                        for (var j = 0; j < _.num1.value; j++)
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
                                    count: _.num1.value,
                                    svgUrl: ObjectConstant
                                        .objList[_.object.value].image,
                                    parentSvg: ObjectConstant
                                        .objList[_.object.value].background,
                                  ),
                          ),
                          SizedBox(
                            width: Sizes.padding_vertical.h,
                          ),
                          Expanded(
                            flex: 1,
                            child: _.num2.value < 12
                                ? Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(20),
                                      border:
                                          Border.all(color: Colors.grey[200]),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.8),
                                          blurRadius: 8,
                                          offset: Offset(1, 1),
                                        ),
                                      ],
                                    ),
                                    padding: EdgeInsets.all(3),
                                    child: Wrap(
                                      children: [
                                        for (var j = 0; j < _.num2.value; j++)
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
                                    count: _.num2.value,
                                    svgUrl: ObjectConstant
                                        .objList[_.object.value].image,
                                    parentSvg: ObjectConstant
                                        .objList[_.object.value].background,
                                  ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                '${_.num1.value}',
                                style: Theme.of(context)
                                    .textTheme
                                    .whiteBoldHeadline5
                                    .copyWith(
                                      color: Colors.black,
                                    ),
                              ),
                            ),
                          ),
                          DragTarget<int>(
                            onAccept: (receivedItem) {
                              _.submitAnswer(receivedItem);
                            },
                            onWillAccept: (receivedItem) => true,
                            builder: (context, acceptedItems, rejectedItems) {
                              if (_.next.value) {
                                return Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.lightGreen,
                                  ),
                                  child: Center(
                                    child: Text(
                                        _.answerList[_.correctIndex.value],
                                        style: Theme.of(context)
                                            .textTheme
                                            .whiteBoldHeadline5),
                                  ),
                                );
                              } else {
                                return Container(
                                  height: 60,
                                  width: 60,
                                  child: DottedBorder(
                                    borderType: BorderType.RRect,
                                    color: Colors.white,
                                    dashPattern: [8, 4],
                                    strokeWidth: 3,
                                    radius: Radius.circular(12),
                                    child: Center(
                                      child: Text(
                                        '?',
                                        style: GoogleFonts.coiny(
                                          color: Colors.white,
                                          fontSize: 32,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                '${_.num2.value}',
                                style: Theme.of(context)
                                    .textTheme
                                    .whiteBoldHeadline5
                                    .copyWith(
                                      color: Colors.black,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      _.next.value
                          ? Image.asset('assets/animation/tenor_clap.gif',
                              height: 90)
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                for (var i = 0; i < 3; i++)
                                  buildDraggable(i, _, context)
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
                                        named: Routers.compareFill,
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

  Draggable<int> buildDraggable(
      int i, CompareFillExeController _, BuildContext context) {
    return Draggable<int>(
      data: i,
      childWhenDragging: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white.withOpacity(0.5),
        ),
      ),
      feedback: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            _.answerList[i],
            style: Theme.of(context).textTheme.whiteBoldHeadline3.copyWith(
                  color: Colors.black,
                ),
          ),
        ),
      ),
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            _.answerList[i],
            style: Theme.of(context)
                .textTheme
                .whiteBoldHeadline3
                .copyWith(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
