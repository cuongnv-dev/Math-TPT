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
import 'package:math/presentation/controller/plus_drag_image_to_answer_controller.dart';
import 'package:math/presentation/controller/sort_exercise_controller.dart';
import 'package:math/presentation/journeys/user_manual/natural_number_guide.dart';
import 'package:math/presentation/widgets/back_button_widget.dart';
import 'package:math/presentation/widgets/custom_container_widget.dart';
import 'package:math/presentation/widgets/guide_button_widget.dart';
import 'package:math/presentation/widgets/result_screen.dart';
import '../../../../../common/extensions/size_extensions.dart';
import '../../../../themes/theme_text.dart';

class SortExerciseScreen extends StatelessWidget {
  List<int> answers = [-1, -1, -1, -1];

  @override
  Widget build(BuildContext context) {
    double dimen = (ScreenUtil.screenWidth - Sizes.padding_horizontal.w) / 5;
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
            child: GetBuilder<SortExerciseController>(
              init: SortExerciseController(),
              builder: (_) {
                return Obx(
                  () => Column(
                    children: <Widget>[
                      SizedBox(
                        height: ScreenUtil.statusBarHeight,
                      ),
                      Text(
                        _.type.value == 'AZ'
                            ? 'Sắp xếp từ bé đến lớn'
                            : 'Sắp xếp từ lớn đến bé',
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
                                    .whiteBoldHeadline6
                                    .copyWith(),
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
                            Get.to(NaturalNumberGuide());
                          }),
                        ],
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          for (var i = 0; i < 4; i++)
                            DragTarget<int>(
                              onAccept: (receivedItem) {
                                answers[i] = receivedItem;
                                _.submitAnswer(answers);
                                print(answers);
                              },
                              onWillAccept: (receivedItem) {
                                return true;
                              },
                              builder: (context, acceptedItems, rejectedItems) {
                                if (_.borderList[i] == 1) {
                                  return Container(
                                    width: dimen,
                                    height: dimen,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.lightGreen,
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${answers[i]}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .whiteBoldHeadline5
                                            .copyWith(),
                                      ),
                                    ),
                                  );
                                } else {
                                  return Container(
                                    height: dimen,
                                    width: dimen,
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
                        ],
                      ),
                      Spacer(),
                      _.next.value
                          ? Image.asset('assets/animation/tenor_clap.gif',
                              height: 100)
                          : Container(),
                      SizedBox(height: Sizes.padding_vertical.h * 2),
                      _.next.value
                          ? GestureDetector(
                              onTap: () {
                                if (_.questionCount.value < 10) {
                                  answers = [-1, -1, -1, -1];
                                  // playSound('correct.mp3');
                                  _.generateNewQuestion();
                                } else {
                                  Get.off(ResultScreen(
                                    correctAnswers: 10,
                                    score: _.score.value,
                                    showAnswerCount: false,
                                    named: Routers.sort,
                                    params: Get.arguments,
                                  ));
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
                                    height: 45,
                                    width: Sizes.dimen_150.w,
                                    decoration: BoxDecoration(
                                      color: Colors.orange[400],
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(
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
                                  ),
                                ],
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                for (var i = 0; i < 4; i++)
                                  buildDraggable(i, _, context, dimen)
                              ],
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

  Draggable<int> buildDraggable(
      int i, SortExerciseController _, BuildContext context, double dimen) {
    return Draggable<int>(
        data: _.randomList[i],
        childWhenDragging: Container(
          width: dimen,
          height: dimen,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white.withOpacity(0.5),
          ),
        ),
        feedback: Container(
          width: dimen,
          height: dimen,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Center(
            child: Text(
              '${_.randomList[i]}',
              style: Theme.of(context)
                  .textTheme
                  .whiteBoldHeadline5
                  .copyWith(color: Colors.black),
            ),
          ),
        ),
        child: Container(
          width: dimen,
          height: dimen,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Center(
            child: Text(
              '${_.randomList[i]}',
              style: Theme.of(context)
                  .textTheme
                  .whiteBoldHeadline5
                  .copyWith(color: Colors.black),
            ),
          ),
        ));
  }
}
