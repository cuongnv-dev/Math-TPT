import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math/common/constants/size_constants.dart';
import 'package:math/presentation/journeys/user_manual/natural_number_guide.dart';
import 'package:math/presentation/widgets/back_button_widget.dart';
import 'package:math/presentation/widgets/sub_menu_button_widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../common/extensions/size_extensions.dart';
import '../../themes/theme_text.dart';

class CompareGuide extends StatefulWidget {
  @override
  _CompareGuideState createState() => _CompareGuideState();
}

class _CompareGuideState extends State<CompareGuide> {
  YoutubePlayerController _controller1;
  YoutubePlayerController _controller2;
  YoutubePlayerController _controller3;
  YoutubePlayerController _controller4;

  @override
  void initState() {
    super.initState();
    _controller1 = YoutubePlayerController(
      initialVideoId: '0dR6L0KwF-8',
      flags: YoutubePlayerFlags(
        mute: true,
        autoPlay: false,
      ),
    );
    _controller2 = YoutubePlayerController(
      initialVideoId: 'Tshs9KedOxg',
      flags: YoutubePlayerFlags(
        mute: true,
        autoPlay: false,
      ),
    );
    _controller3 = YoutubePlayerController(
      initialVideoId: 'uAb_5TDndAA',
      flags: YoutubePlayerFlags(
        mute: true,
        autoPlay: false,
      ),
    );
    _controller4 = YoutubePlayerController(
      initialVideoId: 'i3p9jBpfoWM',
      flags: YoutubePlayerFlags(
        mute: true,
        autoPlay: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                left: Sizes.padding_horizontal.w,
                right: Sizes.padding_horizontal.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackButtonWidget(),
                  Center(
                    child: Text(
                      'H?????ng d???n ph???n so s??nh',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  SizedBox(height: Sizes.padding_vertical.h),
                  YoutubePlayer(
                    controller: _controller1,
                    showVideoProgressIndicator: true,
                    onReady: () {
                      print('Player is ready.');
                    },
                  ),
                  SizedBox(height: Sizes.padding_vertical.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assets/png/cp2.png', height: 350),
                      Image.asset('assets/png/cp1.png', height: 350)
                    ],
                  ),
                  SizedBox(height: Sizes.padding_vertical.h),
                  Text('G???m 4 d???ng '),
                  Text('Ch???n d???ng b??i r???i ???n v??o ???b???t ?????u??? '),
                  SizedBox(height: Sizes.padding_vertical.h),
                  //B??i 1
                  Text('1. Ch???n s??? l???n h??n, b?? h??n:',
                      style: Theme.of(context).textTheme.subtitle2),
                  SizedBox(height: Sizes.padding_vertical.h),
                  YoutubePlayer(
                    controller: _controller2,
                    showVideoProgressIndicator: true,
                    onReady: () {
                      print('Player is ready.');
                    },
                  ),
                  SizedBox(height: Sizes.padding_vertical.h),
                  Text(
                    '- C?? 2 s??? ???????c hi???n th??? d?????i m??n h??nh, ph??a tr??n l?? bi???u t?????ng bi???u th??? cho s??? ????. Ch???n ????p ??n ????ng b???ng c??ch nh???n v??o s??? l???n h??n hay b?? h??n theo y??u c???u ????? b??i. Ch?? m??o s??? ?????ng h??nh x??c ?????nh k???t qu??? ????ng sai.',
                  ),
                  Text(
                    '- K???t qu??? ????ng s??? c?? m??i t??n hi???n ra, ???n v??o m??i t??n ????? sang b??i ti???p theo.',
                  ),
                  SizedBox(height: Sizes.padding_vertical.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assets/png/cp3.png', height: 350),
                      Image.asset('assets/png/cp4.png', height: 350)
                    ],
                  ),
                  SizedBox(height: Sizes.padding_vertical.h * 2),
                  //B??i 2
                  Text('2. Ch???n s??? l???n l???n nh???t, b?? nh???t',
                      style: Theme.of(context).textTheme.subtitle2),
                  SizedBox(height: Sizes.padding_vertical.h),
                  YoutubePlayer(
                    controller: _controller3,
                    showVideoProgressIndicator: true,
                    onReady: () {
                      print('Player is ready.');
                    },
                  ),
                  SizedBox(height: Sizes.padding_vertical.h),

                  Text(
                    '- C?? 3 s??? ???????c hi???n th??? b??n c???nh 3 h??nh bi???u t?????ng cho s??? ????. Ch???n ????p ??n ????ng b???ng c??ch nh???n v??o s??? l???n nh???t ho???c b?? nh???t (t??y y??u c???u ????? b??i) trong 3 s???. Ch?? m??o s??? ?????ng h??nh x??c ?????nh k???t qu??? ????ng sai.',
                  ),
                  Text(
                    '- K???t qu??? ????ng s??? c?? m??i t??n hi???n ra, ???n v??o m??i t??n ????? sang b??i ti???p theo.',
                  ),
                  SizedBox(height: Sizes.padding_vertical.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assets/png/cp5.png', height: 350),
                      Image.asset('assets/png/cp6.png', height: 350)
                    ],
                  ),
                  SizedBox(height: Sizes.padding_vertical.h * 2),
                  //B??i 3
                  Text('3. ??i???n d???u',
                      style: Theme.of(context).textTheme.subtitle2),
                  SizedBox(height: Sizes.padding_vertical.h),

                  YoutubePlayer(
                    controller: _controller4,
                    showVideoProgressIndicator: true,
                    onReady: () {
                      print('Player is ready.');
                    },
                  ),
                  SizedBox(height: Sizes.padding_vertical.h),
                  Text(
                    '- C??c d???u >, <, = ???????c hi???n ra ph??a d?????i m??n h??nh. Quan s??t h??nh bi???u t?????ng v?? ch???n d???u th??ch h???p k??o th??? v??o ?? vu??ng c?? d???u ch???m h???i. Ch?? m??o s??? ?????ng h??nh x??c ?????nh k???t qu??? ????ng sai.',
                  ),
                  Text(
                    '- K???t qu??? ????ng d???u m??i t??n s??? hi???n th???, ???n v??o m??i t??n ????? sang b??i ti???p theo.',
                  ),
                  SizedBox(height: Sizes.padding_vertical.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assets/png/cp7.png', height: 350),
                      Image.asset('assets/png/cp8.png', height: 350)
                    ],
                  ),
                  SizedBox(height: Sizes.padding_vertical.h * 2),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
