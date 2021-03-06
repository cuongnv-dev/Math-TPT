import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math/common/constants/size_constants.dart';
import 'package:math/presentation/journeys/user_manual/campare_guide.dart';
import 'package:math/presentation/journeys/user_manual/natural_number_guide.dart';
import 'package:math/presentation/widgets/back_button_widget.dart';
import 'package:math/presentation/widgets/sub_menu_button_widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../common/extensions/size_extensions.dart';
import '../../themes/theme_text.dart';

class OtherGuide extends StatefulWidget {
  @override
  _OtherGuideState createState() => _OtherGuideState();
}

class _OtherGuideState extends State<OtherGuide> {
  YoutubePlayerController _controller1;
  YoutubePlayerController _controller2;
  YoutubePlayerController _controller3;
  YoutubePlayerController _controller4;
  YoutubePlayerController _controller5;

  @override
  void initState() {
    super.initState();
    _controller1 = YoutubePlayerController(
      initialVideoId: 'MN6JXV27z44',
      flags: YoutubePlayerFlags(
        mute: true,
        autoPlay: false,
      ),
    );
    _controller2 = YoutubePlayerController(
      initialVideoId: 'kdp0poBBBtY',
      flags: YoutubePlayerFlags(
        mute: true,
        autoPlay: false,
      ),
    );
    _controller3 = YoutubePlayerController(
      initialVideoId: 'RqTHhmkZE7w',
      flags: YoutubePlayerFlags(
        mute: true,
        autoPlay: false,
      ),
    );
    _controller4 = YoutubePlayerController(
      initialVideoId: 'v73h7oPuveo',
      flags: YoutubePlayerFlags(
        mute: true,
        autoPlay: false,
      ),
    );
    //
    _controller5 = YoutubePlayerController(
      initialVideoId: 'L3eoyag5yqw',
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
                  SizedBox(height: Sizes.padding_vertical.h),

                  Center(
                    child: Text(
                      'H?????ng d???n ph???n c???ng, tr???, nh??n, chia',
                      style: Theme.of(context).textTheme.subtitle2,
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
                  Center(
                      child: Image.asset('assets/png/other1.png', height: 350)),
                  Text('G???m 4 d???ng '),
                  Text('Ch???n d???ng b??i r???i ???n v??o ???b???t ?????u??? '),
                  SizedBox(height: Sizes.padding_vertical.h),
                  //B??i 1
                  Text('1. Ch???n ????p ??n ????ng',
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
                    '-C?? 3 s??? ???????c hi???n th??? d?????i m??n h??nh, quan s??t h??nh hi???n th??? sau ???? t??nh v?? ch???n ????p ??n ????ng b???ng c??ch nh???n v??o s??? ????. ',
                  ),
                  Text(
                    '- Ch?? m??o s??? ?????ng h??nh x??c ?????nh k???t qu??? ????ng sai. K???t qu??? ????ng s??? c?? m??i t??n hi???n ra, ???n v??o m??i t??n ????? sang b??i ti???p theo.',
                  ),
                  SizedBox(height: Sizes.padding_vertical.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assets/png/other2.png', height: 350),
                      Image.asset('assets/png/other3.png', height: 350)
                    ],
                  ),
                  SizedBox(height: Sizes.padding_vertical.h * 2),
                  //B??i 2
                  Text('2. Ch???n ph??p t??nh ????ng',
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
                    '- C?? 4 ph??p t??nh hi???n ra ph??a d?????i m??n h??nh. Quan s??t h??nh hi???n th??? r???i ch???n ph??p t??nh t????ng ???ng, sau ???? k??o th??? v??o ?? vu??ng c?? d???u ch???m h???i. N???u ch???n  ph??p t??nh sai th?? kh??ng ?????t v??o ?? vu??ng ???????c. N???u ch???n ????ng ph??p t??nh ????ng  th?? ch?? m??o vui v??? v?? m??i t??n s??? hi???n ra, nh???n v??o m??i t??n ????? sang b??i ti???p theo.',
                  ),
                  SizedBox(height: Sizes.padding_vertical.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assets/png/other4.png', height: 350),
                      Image.asset('assets/png/other5.png', height: 350)
                    ],
                  ),
                  SizedBox(height: Sizes.padding_vertical.h * 2),
                  //B??i 3
                  Text('3. Vi???t ph??p t??nh',
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
                    '- B??n tr??i l?? bi???u t?????ng, b??n ph???i l?? ph??p t??nh d???c. Quan s??t h??nh, vi???t ph??p t??nh v?? t??nh b???ng c??ch ???n v??o ?? vu??ng tr???ng (?? vu??ng hi???n th??? m??u v??ng) sau ???? ???n v??o s??? th??ch h???p ph??a d?????i m??n h??nh ho??n th??nh h???t ?? tr???ng.',
                  ),
                  Text(
                    '- Ch?? m??o s??? ?????ng h??nh ki???m tra k??t qu??? ????ng, sai. K???t qu??? ????ng s??? c?? m??i t??n hi???n ra, ???n v??o m??i t??n ????? sang b??i ti???p theo.',
                  ),
                  SizedBox(height: Sizes.padding_vertical.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assets/png/other6.png', height: 350),
                      Image.asset('assets/png/other7.png', height: 350)
                    ],
                  ),
                  SizedBox(height: Sizes.padding_vertical.h * 2),
                  //B??i 4
                  Text('4. Gi???i to??n c?? l???i v??n',
                      style: Theme.of(context).textTheme.subtitle2),
                  SizedBox(height: Sizes.padding_vertical.h),
                  YoutubePlayer(
                    controller: _controller5,
                    showVideoProgressIndicator: true,
                    onReady: () {
                      print('Player is ready.');
                    },
                  ),
                  Text(
                    '- ??? d???ng to??n n??y c?? 3 ph???n: ph???n 1 ????? b??i; ph???n 2 vi???t ph??p t??nh, ph???n 3 vi???t c??u tr??? l???i.',
                  ),
                  Text(
                    '- ?????c ????? b??i sau ???? ???n v??o ?? vu??ng c??n tr???ng (?? vu??ng ???? s??? hi???n m??u v??ng) ch???n s??? th??ch h???p b???ng c??ch nh???n v??o s??? b??n d?????i m??n h??nh ????? ho??n th??nh ph??p t??nh. Sau khi ??i???n xong c??c ?? tr???ng, ???n v??o ???Ki???m tra???.',
                  ),
                  SizedBox(height: Sizes.padding_vertical.h),
                  Wrap(
                    spacing: 20.0, // gap between adjacent chips
                    runSpacing: 10.0,
                    alignment: WrapAlignment.center,
                    children: [
                      Image.asset('assets/png/other8.png', height: 330),
                      Image.asset('assets/png/other9.png', height: 330),
                      Image.asset('assets/png/other10.png', height: 330),
                    ],
                  ),
                  SizedBox(height: Sizes.padding_vertical.h),
                  Text(
                    '- ?????c ????? b??i sau ???? ???n v??o ?? vu??ng c??n tr???ng (?? vu??ng ???? s??? hi???n m??u v??ng) ch???n s??? th??ch h???p b???ng c??ch nh???n v??o s??? b??n d?????i m??n h??nh ????? ho??n th??nh ph??p t??nh. Sau khi ??i???n xong c??c ?? tr???ng, ???n v??o ???Ki???m tra???.',
                  ),
                  Text(
                      '- K???t qu??? ????ng th?? ?? s??? hi???n m??u xanh v?? ch??? ???ti???p t???c???, ???n v??o ???ti???p t???c??? ????? sang b??i ti???p theo. K???t qu??? sai th?? ?? vu??ng hi???n m??u ?????, nh???n v??o ?? sai sau ???? ch???n l???i s??? th??ch h???p. '),
                  SizedBox(height: Sizes.padding_vertical.h * 2),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector buildButton(
      {BuildContext context, Function onTap, String title}) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: Sizes.dimen_10.h,
              left: Sizes.dimen_24.w,
              right: Sizes.dimen_24.w,
            ),
            width: double.infinity,
            height: 55,
            decoration: BoxDecoration(
              color: Colors.lightBlue[700],
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: Sizes.dimen_10.h,
              left: Sizes.dimen_24.w,
              right: Sizes.dimen_24.w,
            ),
            width: double.infinity,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.lightBlue[400],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
                child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .whiteSubtitle2
                  .copyWith(fontWeight: FontWeight.w600),
              maxLines: 1,
            )),
          ),
        ],
      ),
    );
  }
}
