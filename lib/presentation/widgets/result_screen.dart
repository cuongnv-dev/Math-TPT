import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:math/common/constants/size_constants.dart';
import '../../common/extensions/size_extensions.dart';
import '../themes/theme_text.dart';
import 'custom_container_widget.dart';

class ResultScreen extends StatelessWidget {
  final int correctAnswers;
  final String named;
  final bool showAnswerCount;
  final int score;
  final dynamic params;
  // final

  const ResultScreen({
    Key key,
    @required this.correctAnswers,
    @required this.named,
    this.showAnswerCount,
    this.score,
    this.params,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/png/sky.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Container(
              color: Colors.black.withOpacity(0.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Hoàn thành',
                      style: Theme.of(context).textTheme.whiteBoldHeadline4),
                  SizedBox(
                    height: Sizes.dimen_10.h,
                  ),
                  Text(
                    '$score Điểm',
                    style: Theme.of(context)
                        .textTheme
                        .whiteBoldHeadline4
                        .copyWith(color: Colors.white),
                  ),
                  SizedBox(
                    height: Sizes.dimen_10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SvgPicture.asset(
                        'assets/svg/diamond.svg',
                        width: Sizes.dimen_55.w,
                      ),
                      SizedBox(
                        width: Sizes.padding_horizontal.w,
                      ),
                      score >= 50
                          ? SvgPicture.asset(
                              'assets/svg/diamond.svg',
                              width: Sizes.dimen_55.w,
                            )
                          : Container(),
                      SizedBox(
                        width: Sizes.padding_horizontal.w,
                      ),
                      score >= 80
                          ? SvgPicture.asset(
                              'assets/svg/diamond.svg',
                              width: Sizes.dimen_55.w,
                            )
                          : Container(),
                    ],
                  ),
                  SizedBox(
                    height: Sizes.padding_vertical.h,
                  ),
                  showAnswerCount
                      ? Column(
                          children: [
                            Container(
                              width: Sizes.dimen_200.w,
                              height: Sizes.dimen_20.h,
                              decoration: BoxDecoration(
                                color: Colors.orange[400],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                  child: Text(
                                'Số câu đúng: $correctAnswers',
                                style: Theme.of(context)
                                    .textTheme
                                    .whiteSubtitle1
                                    .copyWith(fontStyle: FontStyle.italic),
                              )),
                            ),
                            SizedBox(
                              height: Sizes.dimen_2.h,
                            ),
                            Container(
                              width: Sizes.dimen_200.w,
                              height: Sizes.dimen_20.h,
                              decoration: BoxDecoration(
                                color: Colors.orange[400],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                  child: Text(
                                'Số câu sai: ${10 - correctAnswers}',
                                style: Theme.of(context)
                                    .textTheme
                                    .whiteSubtitle1
                                    .copyWith(fontStyle: FontStyle.italic),
                              )),
                            ),
                          ],
                        )
                      : Container(),
                  SizedBox(height: Sizes.dimen_14.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CustomContainer(
                        childWidget: Center(
                          child: SvgPicture.asset(
                            'assets/svg/more.svg',
                            color: Colors.white,
                          ),
                        ),
                        outsideHeight: 60,
                        insideHeight: 55,
                        width: 60,
                        outsideColor: Colors.orange[800],
                        insideColor: Colors.orange[400],
                        borderRadius: 40,
                        padding: EdgeInsets.all(Sizes.dimen_10.w),
                        onTap: () {
                          print('back');
                          Get.back(
                              // arguments: params != null ? {'type': params} : {},
                              );
                        },
                      ),
                      SizedBox(width: Sizes.dimen_40.w),
                      CustomContainer(
                        childWidget: Center(
                          child: SvgPicture.asset(
                            'assets/svg/repeat.svg',
                            color: Colors.white,
                          ),
                        ),
                        outsideHeight: 60,
                        insideHeight: 55,
                        width: 60,
                        outsideColor: Colors.orange[800],
                        insideColor: Colors.orange[400],
                        borderRadius: 40,
                        padding: EdgeInsets.all(Sizes.dimen_10.w),
                        onTap: () {
                          Get.offNamed(
                            named,
                            arguments: params,
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
            Stack(children: <Widget>[
              Positioned(
                  top: 100,
                  left: 10,
                  height: 200,
                  width: 500,
                  child: Container(
                      child: FlareActor(
                    "assets/animation/firework_red.flr",
                    animation: "explode",
                  ))),
              Positioned(
                top: 100,
                left: 40,
                height: 150,
                width: 200,
                child: Container(
                  child: FlareActor(
                    "assets/animation/firework_blue.flr",
                    animation: "explode",
                  ),
                ),
              ),
              Positioned(
                top: 300,
                left: 10,
                height: 150,
                width: 200,
                child: Container(
                  child: FlareActor(
                    "assets/animation/firework_yellow.flr",
                    animation: "explode",
                  ),
                ),
              ),
              Positioned(
                top: 50,
                left: 10,
                height: 150,
                width: 200,
                child: Container(
                  child: FlareActor(
                    "assets/animation/firework_pink.flr",
                    animation: "explode",
                  ),
                ),
              ),
              Positioned(
                top: 30,
                left: 100,
                height: 150,
                width: 200,
                child: Container(
                  child: FlareActor(
                    "assets/animation/firework_green.flr",
                    animation: "explode",
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
