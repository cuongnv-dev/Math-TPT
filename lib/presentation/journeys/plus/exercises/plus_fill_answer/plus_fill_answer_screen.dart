import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math/common/constants/size_constants.dart';
import 'package:math/common/routes/routers.dart';
import 'package:math/common/screenutil/screenutil.dart';
import 'package:math/data/mock/object_constant.dart';
import 'package:math/presentation/controller/plus_fill_answer_exe_controlle.dart';
import 'package:math/presentation/widgets/back_button_widget.dart';
import 'package:math/presentation/widgets/custom_container_widget.dart';
import 'package:math/presentation/widgets/guide_button_widget.dart';
import 'package:math/presentation/widgets/large_number_widget.dart';
import 'package:math/presentation/widgets/result_screen.dart';
import '../../../../../common/extensions/size_extensions.dart';
import '../../../../themes/theme_text.dart';

class PlusFillAnswerScreen extends StatelessWidget {
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
            image: AssetImage("assets/png/ocean.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          height: ScreenUtil.screenHeight,
          padding: EdgeInsets.only(
            left: Sizes.padding_horizontal.w,
            right: Sizes.padding_horizontal.w,
            bottom: Sizes.padding_vertical.h * 2,
          ),
          color: Colors.black.withOpacity(0.4),
          child: GetBuilder<PlusFillAnswerController>(
            init: PlusFillAnswerController(),
            initState: (_) {},
            builder: (_) {
              String svgUrl = Get.arguments['type'] != 'SM'
                  ? ObjectConstant.fruits[5]
                  : ObjectConstant.seaAnimals[_.object.value];
              return Obx(
                () => Column(
                  children: <Widget>[
                    SizedBox(
                      height: ScreenUtil.statusBarHeight,
                    ),
                    Text(
                      'Viết phép tính',
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
                        GuideButtonWidget(),
                      ],
                    ),
                    SizedBox(
                      height: Sizes.padding_vertical.h * 2,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: <Widget>[
                              ConstrainedBox(
                                constraints: new BoxConstraints(
                                    minWidth: Get.arguments['type'] == 'SM'
                                        ? ScreenUtil.screenWidth / 2
                                        : 0),
                                child: Get.arguments['type'] == 'SM'
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
                                          alignment: WrapAlignment.center,
                                          children: [
                                            for (var j = 0;
                                                j < _.num1.value;
                                                j++)
                                              Padding(
                                                padding: EdgeInsets.all(3.0),
                                                child: SvgPicture.asset(
                                                  svgUrl,
                                                  height: 40,
                                                ),
                                              ),
                                          ],
                                        ),
                                      )
                                    : LargeNumWidget(
                                        count: _.num1.value,
                                        svgUrl: ObjectConstant
                                            .objList[_.object.value].image,
                                        parentSvg: ObjectConstant
                                            .objList[_.object.value].background,
                                      ),
                              ),
                              SizedBox(height: Sizes.padding_vertical.h),
                              ConstrainedBox(
                                constraints: new BoxConstraints(
                                    minWidth: Get.arguments['type'] == 'SM'
                                        ? ScreenUtil.screenWidth / 2
                                        : 0),
                                child: Get.arguments['type'] == 'SM'
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
                                          alignment: WrapAlignment.center,
                                          children: [
                                            for (var j = 0;
                                                j < _.num2.value;
                                                j++)
                                              Padding(
                                                padding: EdgeInsets.all(3.0),
                                                child: SvgPicture.asset(
                                                  svgUrl,
                                                  height: 40,
                                                ),
                                              ),
                                          ],
                                        ),
                                      )
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
                        ),
                        Expanded(
                            flex: 2,
                            child: Column(
                              children: <Widget>[
                                _.resultList[2] < 11
                                    ? Row(
                                        mainAxisAlignment: _.resultList[2] < 10
                                            ? MainAxisAlignment.center
                                            : MainAxisAlignment.end,
                                        children: [
                                          buildNumber(_, context, 0),
                                        ],
                                      )
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: <Widget>[
                                          buildNumber(_, context, 0),
                                          SizedBox(width: 5),
                                          buildNumber(_, context, 1)
                                        ],
                                      ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: SvgPicture.asset(
                                    'assets/svg/plus.svg',
                                    color: Colors.white,
                                    height: 20,
                                  ),
                                ),
                                _.resultList[2] < 11
                                    ? Row(
                                        mainAxisAlignment: _.resultList[2] < 10
                                            ? MainAxisAlignment.center
                                            : MainAxisAlignment.end,
                                        children: [
                                          buildNumber(_, context, 1),
                                        ],
                                      )
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: <Widget>[
                                          buildNumber(_, context, 2),
                                          SizedBox(width: 5),
                                          buildNumber(_, context, 3)
                                        ],
                                      ),
                                Divider(
                                  thickness: 2,
                                  indent: 10,
                                  endIndent: 10,
                                  color: Colors.white,
                                ),
                                _.resultList[2] < 10
                                    ? Row(
                                        mainAxisAlignment: _.resultList[2] < 10
                                            ? MainAxisAlignment.center
                                            : MainAxisAlignment.end,
                                        children: [
                                          buildNumber(_, context, 2),
                                        ],
                                      )
                                    : (_.resultList[2] > 10
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: <Widget>[
                                              buildNumber(_, context, 4),
                                              SizedBox(width: 5),
                                              buildNumber(_, context, 5)
                                            ],
                                          )
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: <Widget>[
                                              buildNumber(_, context, 2),
                                              SizedBox(width: 5),
                                              buildNumber(_, context, 3)
                                            ],
                                          ))
                              ],
                            ))
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
                                          named: Routers.plusFillAnswerEx,
                                          params: Get.arguments,
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
      PlusFillAnswerController _, BuildContext context, int index) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: GestureDetector(
        onTap: !_.next.value &&
                _.borderList[index] != 1 &&
                _.borderList[index] != -2
            ? () {
                _.inputOnTap(index);
              }
            : null,
        child: Container(
          width: 50,
          height: 50,
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
              _.answerList[index] != '-1' ? '${_.answerList[index]}' : '',
              style: Theme.of(context).textTheme.headline5.copyWith(
                    color:
                        (_.borderList[index] == 1 || _.borderList[index] == 2)
                            ? Colors.white
                            : Colors.black,
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
    PlusFillAnswerController _,
  ) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Material(
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          highlightColor: Colors.lightBlue,
          onTap: (_.borderList.indexOf(0) != -1 &&
                  _.answerList[_.borderList.indexOf(0)] == '-1')
              ? () {
                  _.keyBoardOnTap(i.toString(), _.borderList.indexOf(0));
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
