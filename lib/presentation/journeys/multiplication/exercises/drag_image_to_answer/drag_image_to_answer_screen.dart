import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math/common/constants/size_constants.dart';
import 'package:math/common/routes/routers.dart';
import 'package:math/common/screenutil/screenutil.dart';
import 'package:math/data/mock/object_constant.dart';
import 'package:math/presentation/controller/multiplication_drag_image_to_answer_controller.dart';
import 'package:math/presentation/journeys/user_manual/orther_guide.dart';
import 'package:math/presentation/widgets/back_button_widget.dart';
import 'package:math/presentation/widgets/custom_container_widget.dart';
import 'package:math/presentation/widgets/guide_button_widget.dart';
import 'package:math/presentation/widgets/result_screen.dart';
import '../../../../../common/extensions/size_extensions.dart';
import '../../../../themes/theme_text.dart';

class MultiplicationDragAnswerToImage extends StatelessWidget {
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
            child: GetBuilder<MultiplicationDragImageToAnswerController>(
              init: MultiplicationDragImageToAnswerController(),
              builder: (_) {
                return Obx(
                  () => Column(
                    children: [
                      SizedBox(
                        height: ScreenUtil.statusBarHeight,
                      ),
                      Text(
                        'Chọn phép tính đúng',
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
                            outsideHeight: 50,
                            insideHeight: 45,
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
                        alignment: WrapAlignment.center,
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
                                                ? (Get.arguments['type'] > 3 &&
                                                        _.question.value > 8
                                                    ? 20
                                                    : 30)
                                                : 40,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      SizedBox(height: Sizes.padding_vertical.h * 2),
                      DragTarget<int>(
                        onAccept: (receivedItem) {
                          _.submitAnswer(receivedItem);
                        },
                        onWillAccept: (receivedItem) => true,
                        builder: (context, acceptedItems, rejectedItems) {
                          if (_.next.value) {
                            return Container(
                              width: ScreenUtil.screenWidth / 2 - 40,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.lightGreen,
                              ),
                              child: Center(
                                child: Text(
                                  _.answerList[_.correctIndex.value],
                                  style: Theme.of(context)
                                      .textTheme
                                      .whiteBoldHeadline6,
                                ),
                              ),
                            );
                          } else {
                            return Container(
                              height: 50,
                              width: ScreenUtil.screenWidth / 2 - 40,
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
                      Spacer(),
                      _.next.value
                          ? Column(
                              children: [
                                Image.asset('assets/animation/tenor_clap.gif',
                                    height: 90),
                                SizedBox(height: Sizes.padding_vertical.h * 2),
                                Center(
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
                                            named: Routers
                                                .multiplicationDragImageEx,
                                            params: Get.arguments,
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(height: Sizes.padding_vertical.h * 2),
                              ],
                            )
                          : Expanded(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        for (var i = 0; i < 2; i++)
                                          buildDraggable(i, _, context)
                                      ],
                                    ),
                                    SizedBox(
                                      height: Sizes.padding_vertical.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        for (var i = 2; i < 4; i++)
                                          buildDraggable(i, _, context)
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
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

  Draggable<int> buildDraggable(int i,
      MultiplicationDragImageToAnswerController _, BuildContext context) {
    return Draggable<int>(
      data: i,
      childWhenDragging: Container(
        width: ScreenUtil.screenWidth / 2 - 40,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white.withOpacity(0.5),
        ),
      ),
      feedback: Container(
        width: ScreenUtil.screenWidth / 2 - 40,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            _.answerList[i],
            style: Theme.of(context)
                .textTheme
                .whiteBoldHeadline6
                .copyWith(color: Colors.black),
          ),
        ),
      ),
      child: Container(
        width: ScreenUtil.screenWidth / 2 - 40,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            _.answerList[i],
            style: Theme.of(context)
                .textTheme
                .whiteBoldHeadline6
                .copyWith(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
