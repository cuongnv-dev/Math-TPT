import 'package:flutter/material.dart';
import 'package:math/common/constants/size_constants.dart';
import 'package:math/presentation/widgets/back_button_widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../common/extensions/size_extensions.dart';

class NaturalNumberGuide extends StatefulWidget {
  @override
  _NaturalNumberGuideState createState() => _NaturalNumberGuideState();
}

class _NaturalNumberGuideState extends State<NaturalNumberGuide> {
  YoutubePlayerController _controller2;
  YoutubePlayerController _controller3;
  YoutubePlayerController _controller4;
  YoutubePlayerController _controller5;
  YoutubePlayerController _controller6;

  @override
  void initState() {
    super.initState();

    _controller2 = YoutubePlayerController(
      initialVideoId: 'yhgRnnI5Aps',
      flags: YoutubePlayerFlags(
        mute: true,
        autoPlay: false,
      ),
    );
    _controller3 = YoutubePlayerController(
      initialVideoId: '9RtFd03uAp0',
      flags: YoutubePlayerFlags(
        mute: true,
        autoPlay: false,
      ),
    );
    _controller4 = YoutubePlayerController(
      initialVideoId: 'Hco1JRbRV2o',
      flags: YoutubePlayerFlags(
        mute: true,
        autoPlay: false,
      ),
    );
    _controller5 = YoutubePlayerController(
      initialVideoId: '5FUq9T_LOTY',
      flags: YoutubePlayerFlags(
        mute: true,
        autoPlay: false,
      ),
    );
    _controller6 = YoutubePlayerController(
      initialVideoId: 'FdO6lVvI9vg',
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
                      'H?????ng d???n ph???n ?????m',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  SizedBox(height: Sizes.padding_vertical.h),
                  YoutubePlayer(
                    controller: _controller2,
                    showVideoProgressIndicator: true,
                    onReady: () {
                      print('Player is ready.');
                    },
                  ),
                  SizedBox(height: Sizes.padding_vertical.h),
                  Text('G???m 4 d???ng '),
                  Text('Ch???n d???ng b??i r???i ???n v??o ???b???t ?????u??? '),
                  SizedBox(height: Sizes.padding_vertical.h),
                  Center(
                      child: Image.asset('assets/png/dem1.png', height: 350)),
                  SizedBox(height: Sizes.padding_vertical.h),
                  Text('1. Ch???n s??? th??ch h???p:',
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
                    '- C?? 3 s??? ???????c hi???n th??? d?????i m??n h??nh, ch???n ????p ??n ????ng b???ng c??ch nh???n v??o s??? ????. ',
                  ),
                  Text(
                    '- N???u sai s??? c?? h??nh con m??o kh??c hi???n ra, nh???n ch???n l???i ????p ??n kh??c. N???u ????ng s??? c?? h??nh con m??o vui v??? xu???t hi???n v?? s??? c?? m??i t??n hi???n ra. Nh???n v??o m??i t??n ????? sang b??i ti???p theo.',
                  ),
                  SizedBox(height: Sizes.padding_vertical.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assets/png/dem2.png', height: 350),
                      Image.asset('assets/png/dem3.png', height: 350)
                    ],
                  ),
                  SizedBox(height: Sizes.padding_vertical.h * 2),
                  Text('2. ??i???n s???:',
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
                    '- C?? m???t d??y s???, c??n tr???ng ??? m???t v??i v??? tr??, nh???n v??o v??? tr?? c??n thi???u (sau khi ???n v??o th?? ch??? ???? hi???n l??n m??u v??ng). Sau ???? ch???n c??c s??? th??ch h???p ??? b??n d?????i m??n h??nh. Ch?? m??o v???n ?????ng h??nh x??c ?????nh k???t qu??? ????ng sai.',
                  ),
                  SizedBox(height: Sizes.padding_vertical.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assets/png/dem4.png', height: 350),
                      Image.asset('assets/png/dem5.png', height: 350)
                    ],
                  ),
                  SizedBox(height: Sizes.padding_vertical.h * 2),
                  Text('3. Vi???t s??? th??ch h???p:',
                      style: Theme.of(context).textTheme.subtitle2),
                  SizedBox(height: Sizes.padding_vertical.h),
                  YoutubePlayer(
                    controller: _controller5,
                    showVideoProgressIndicator: true,
                    onReady: () {
                      print('Player is ready.');
                    },
                  ),
                  SizedBox(height: Sizes.padding_vertical.h),
                  Text(
                    '- ?????m h??nh c?? s???n ????? ch???n c??c s??? th??ch h???p (d??y s??? t??? 1-9 ??? b??n d?????i m??n h??nh) ??i???n v??o ?? tr???ng t????ng ???ng.',
                  ),
                  Text(
                      '- K???t qu??? sai ?? s??? s??? hi???n ra m??u ?????, v?? nh???n ch???n l???i ????p ??n kh??c. K???t qu??? ????ng ?? s??? s??? hi???n m??u xanh v?? c?? m??i t??n hi???n ra. Nh???n v??o m??i t??n ????? sang b??i ti???p theo.'),
                  SizedBox(height: Sizes.padding_vertical.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assets/png/dem6.png', height: 350),
                      Image.asset('assets/png/dem7.png', height: 350)
                    ],
                  ),
                  SizedBox(height: Sizes.padding_vertical.h * 2),
                  Text('4. S???p x???p theo th??? t???:',
                      style: Theme.of(context).textTheme.subtitle2),
                  SizedBox(height: Sizes.padding_vertical.h),
                  YoutubePlayer(
                    controller: _controller6,
                    showVideoProgressIndicator: true,
                    onReady: () {
                      print('Player is ready.');
                    },
                  ),
                  SizedBox(height: Sizes.padding_vertical.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assets/png/dem8.png', height: 350),
                      Image.asset('assets/png/dem9.png', height: 350)
                    ],
                  ),
                  SizedBox(height: Sizes.padding_vertical.h),
                  Text(
                    '- M???t d??y s??? ???????c hi???n ra ph??a d?????i m??n h??nh, s???p x???p c??c s??? theo y??u c???u (t??? l???n ?????n nh??? ho???c t??? nh??? ?????n l???n). K??o th??? s??? ???? v??o ?? vu??ng c?? d???u ch???m h???i. N???u s??? ch???n kh??ng ph?? h???p v???i th??? t??? d??y s??? th?? s??? kh??ng ?????t ???????c s??? ???? v??o ?? vu??ng.',
                  ),
                  Text(
                    '- Ho??n th??nh xong d??y s??? s??? c?? m??i t??n hi???n ra. Nh???n v??o m??i t??n ????? sang b??i ti???p theo	',
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
