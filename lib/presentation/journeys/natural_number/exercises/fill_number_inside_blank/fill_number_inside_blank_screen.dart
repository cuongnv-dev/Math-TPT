import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:math/common/constants/size_constants.dart';
import 'package:math/common/routes/routers.dart';
import 'package:math/common/screenutil/screenutil.dart';
import 'package:math/data/mock/object_constant.dart';
import 'package:math/presentation/controller/fill_number_inside_blank_exe_controlle.dart';
import 'package:math/presentation/widgets/back_button_widget.dart';
import 'package:math/presentation/widgets/custom_container_widget.dart';
import 'package:math/presentation/widgets/guide_button_widget.dart';
import 'package:math/presentation/widgets/result_screen.dart';
import '../../../../../common/extensions/size_extensions.dart';
import '../../../../themes/theme_text.dart';

class FillNumberInsideBlankScreen extends StatelessWidget {
  void playSound(String sound) {
    final player = AudioCache();
    player.play(sound);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/png/sea.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          height: ScreenUtil.screenHeight,
          padding: EdgeInsets.only(
            left: Sizes.padding_horizontal.w,
            right: Sizes.padding_horizontal.w,
            top: ScreenUtil.statusBarHeight,
            bottom: Sizes.padding_vertical.h * 2,
          ),
          color: Colors.black.withOpacity(0.5),
          child: GetBuilder<FillNumberInsideBlankExeController>(
            init: FillNumberInsideBlankExeController(),
            builder: (_) {
              return Obx(
                () => Column(
                  children: <Widget>[
                    Text(
                      'Viết só thích hợp vào ô trống',
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
                        GuideButtonWidget(),
                      ],
                    ),
                    SizedBox(
                      height: Sizes.padding_vertical.h * 2,
                    ),
                    for (var i = 0; i < 3; i++)
                      Column(
                        children: [
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 6,
                                child: ConstrainedBox(
                                  constraints: new BoxConstraints(
                                    minHeight: Sizes.dimen_40.h,
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(20),
                                      border:
                                          Border.all(color: Colors.grey[200]),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.07),
                                          blurRadius: 8,
                                          offset: Offset(1, 1),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Wrap(
                                        children: [
                                          for (var j = 0;
                                              j < _.questionList[i];
                                              j++)
                                            Padding(
                                              padding: EdgeInsets.all(3.0),
                                              child: SvgPicture.asset(
                                                ObjectConstant
                                                    .fruits[_.object.value],
                                                height: 35,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: Sizes.padding_horizontal.w,
                              ),
                              buildNumber(_, context, i),
                              SizedBox(
                                width: Sizes.padding_horizontal.w,
                              ),
                            ],
                          ),
                          SizedBox(height: Sizes.padding_vertical.h),
                        ],
                      ),
                    !_.next.value
                        ? Expanded(
                            child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Wrap(
                                  children: [
                                    for (var i = 0; i < 10; i++)
                                      buildSingleKey(i, context, _)
                                  ],
                                )),
                          )
                        : Expanded(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: CustomContainer(
                                childWidget: Center(
                                  child: _.done.value
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
                                width: Sizes.dimen_140.w,
                                outsideColor: Colors.orange[800],
                                insideColor: Colors.orange[400],
                                borderRadius: 25,
                                onTap: () {
                                  _.done.value
                                      ? Get.off(ResultScreen(
                                          correctAnswers: 10,
                                          score: _.score.value,
                                          showAnswerCount: false,
                                          named: Routers.fillBlank,
                                        ))
                                      : _.generateNewQuestion();
                                },
                              ),
                            ),
                          ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Padding buildNumber(
      FillNumberInsideBlankExeController _, BuildContext context, int index) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: GestureDetector(
        onTap: !_.next.value && _.borderList[index] != 1
            ? () {
                _.inputOnTap(index);
              }
            : null,
        child: Stack(
          children: [
            SvgPicture.asset(
              'assets/svg/flower.svg',
              height: 80,
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
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
                            color: (_.borderList[index] == 1 ||
                                    _.borderList[index] == 2)
                                ? Colors.white
                                : Colors.black,
                          ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildSingleKey(
    int i,
    BuildContext context,
    FillNumberInsideBlankExeController _,
  ) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Material(
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
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
                (ScreenUtil.screenWidth - Sizes.padding_horizontal.w * 2 - 50) /
                    6,
            height:
                (ScreenUtil.screenWidth - Sizes.padding_horizontal.w * 2 - 50) /
                    6,
            child: Center(
              child: Text('$i',
                  style: Theme.of(context).textTheme.boldHeadline5.copyWith()),
            ),
          ),
        ),
      ),
    );
  }
}
