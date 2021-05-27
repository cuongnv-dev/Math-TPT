import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:math/common/constants/size_constants.dart';
import 'package:math/common/routes/routers.dart';
import 'package:math/common/screenutil/screenutil.dart';
import 'package:math/presentation/controller/fill_number_inside_array_exe_controlle.dart';
import 'package:math/presentation/journeys/user_manual/natural_number_guide.dart';
import 'package:math/presentation/widgets/back_button_widget.dart';
import 'package:math/presentation/widgets/custom_container_widget.dart';
import 'package:math/presentation/widgets/guide_button_widget.dart';
import 'package:math/presentation/widgets/result_screen.dart';
import '../../../../../common/extensions/size_extensions.dart';
import '../../../../themes/theme_text.dart';

class FillNumberInsideArrayScreen extends StatelessWidget {
  final String type;
  const FillNumberInsideArrayScreen({Key key, @required this.type})
      : super(key: key);
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
          padding: EdgeInsets.only(
            left: Sizes.padding_horizontal.w,
            right: Sizes.padding_horizontal.w,
            top: ScreenUtil.statusBarHeight,
            bottom: Sizes.padding_vertical.h * 2,
          ),
          color: Colors.black.withOpacity(0.5),
          child: GetBuilder<FillNumberInsideArrayExeController>(
            init: FillNumberInsideArrayExeController(),
            initState: (_) {},
            builder: (_) {
              double size = 0;
              double innerSize = 0;

              size = (ScreenUtil.screenWidth -
                      Sizes.padding_horizontal.w * 2 -
                      40) /
                  4;
              innerSize = size - 30;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Điền số',
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
                  SizedBox(height: Sizes.padding_vertical.h * 3),
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      for (var i = 0; i < _.count.value; i++)
                        buildNumber(_, context, size, innerSize, i)
                    ],
                  ),
                  // SizedBox(height: Sizes.padding_vertical.h),
                  Spacer(),
                  Obx(
                    () => Container(
                      child: _.next.value
                          ? Image.asset('assets/animation/tenor_clap.gif',
                              height: 100)
                          : (_.showResult.value
                              ? Image.asset('assets/animation/tenor.gif',
                                  height: 100)
                              : Container()),
                    ),
                  ),
                  // Spacer(),
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
                                        named: Routers.fillArray,
                                        params: Get.arguments,
                                      ))
                                    : _.generateNewQuestion();
                              },
                            ),
                          ),
                        ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Padding buildSingleKey(
    int i,
    BuildContext context,
    FillNumberInsideArrayExeController _,
  ) {
    return Padding(
      padding: EdgeInsets.all(5.w),
      child: Material(
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          highlightColor: Colors.lightBlue,
          onTap: (_.borderList.indexOf(0) != -1 &&
                  _.questionList[_.borderList.indexOf(0)].toString().length < 2)
              ? () {
                  _.keyBoardOnTap(i, _.borderList.indexOf(0));
                }
              : null,
          child: Container(
            width:
                (ScreenUtil.screenWidth - Sizes.padding_horizontal.w * 2 - 60) /
                    5,
            height:
                (ScreenUtil.screenWidth - Sizes.padding_horizontal.w * 2 - 60) /
                    5,
            child: Center(
              child: Text('$i',
                  style: Theme.of(context).textTheme.boldHeadline5.copyWith()),
            ),
          ),
        ),
      ),
    );
  }

  Padding buildNumber(
      FillNumberInsideArrayExeController _,
      BuildContext context,
      // int number,
      double size,
      double innerSize,
      int index) {
    print(_.borderList);
    return Padding(
      padding: EdgeInsets.all(5),
      child: GestureDetector(
        onTap: !_.next.value &&
                (_.borderList[index] != -2 && _.borderList[index] != 1)
            ? () {
                _.inputOnTap(index);
              }
            : null,
        child: Stack(
          children: [
            SvgPicture.asset(
              'assets/svg/flower.svg',
              height: size,
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: innerSize.w,
                  height: innerSize.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular((innerSize) / 2),
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
                      _.questionList[index] != 0
                          ? '${_.questionList[index]}'
                          : (index == 0 ? '0' : ''),
                      style: Theme.of(context).textTheme.headline5.copyWith(
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
}
