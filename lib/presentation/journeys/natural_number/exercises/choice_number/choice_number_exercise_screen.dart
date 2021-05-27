import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:math/common/constants/size_constants.dart';
import 'package:math/common/routes/routers.dart';
import 'package:math/data/mock/object_constant.dart';
import 'package:math/presentation/controller/choice_number_exe_controller.dart';
import 'package:math/presentation/journeys/user_manual/natural_number_guide.dart';
import 'package:math/presentation/widgets/back_button_widget.dart';
import 'package:math/presentation/widgets/custom_container_widget.dart';
import 'package:math/presentation/widgets/guide_button_widget.dart';
import 'package:math/presentation/widgets/result_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../../common/extensions/size_extensions.dart';
import '../../../../themes/theme_text.dart';

class ChoiceNumberExerciseScreen extends StatefulWidget {
  @override
  _ChoiceNumberExerciseScreenState createState() =>
      _ChoiceNumberExerciseScreenState();
}

class _ChoiceNumberExerciseScreenState
    extends State<ChoiceNumberExerciseScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ChoiceNumberExerciseController>(
        builder: (_) {
          return Obx(
            () => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/png/sea.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                padding: EdgeInsets.only(
                  left: Sizes.padding_horizontal.w,
                  right: Sizes.padding_horizontal.w,
                  top: Sizes.padding_vertical.h * 3,
                  bottom: Sizes.padding_vertical.h * 2,
                ),
                color: Colors.black.withOpacity(0.5),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Chọn số thích hợp',
                      style: Theme.of(context).textTheme.whiteSubtitle2,
                    ),
                    SizedBox(height: Sizes.padding_vertical.h),
                    Row(
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
                        ),
                        GuideButtonWidget(onTap: () {
                          Get.to(NaturalNumberGuide());
                        }),
                      ],
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Obx(
                      () => Expanded(
                        flex: 15,
                        child: Wrap(
                          children: [
                            for (var j = 0; j < _.question.value; j++)
                              Padding(
                                padding: EdgeInsets.all(3.0),
                                child: SvgPicture.asset(
                                  ObjectConstant.fruits[_.object.value],
                                  height: 60,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    _.next.value
                        ? Image.asset('assets/animation/tenor_clap.gif',
                            height: 100)
                        : (_.showResult.value
                            ? Image.asset('assets/animation/tenor.gif',
                                height: 100)
                            : Container()),
                    Obx(
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
                      height: Sizes.dimen_14.h,
                    ),
                    _.next.value
                        ? CustomContainer(
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
                                Get.off(ResultScreen(
                                  correctAnswers: _.rightAnswer.value,
                                  score: _.score.value,
                                  showAnswerCount: false,
                                  named: Routers.choiceNumEx,
                                ));
                              }
                            },
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void playSound(String sound) {
    final player = AudioCache();
    player.play(sound);
  }
}
