import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math/common/constants/size_constants.dart';
import 'package:math/presentation/journeys/user_manual/campare_guide.dart';
import 'package:math/presentation/journeys/user_manual/natural_number_guide.dart';
import 'package:math/presentation/journeys/user_manual/orther_guide.dart';
import 'package:math/presentation/widgets/back_button_widget.dart';
import 'package:math/presentation/widgets/sub_menu_button_widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../common/extensions/size_extensions.dart';
import '../../themes/theme_text.dart';

class UserManual extends StatefulWidget {
  @override
  _UserManualState createState() => _UserManualState();
}

class _UserManualState extends State<UserManual> {
  YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'hHR9dEQNhC8',
      flags: YoutubePlayerFlags(
        mute: true,
        autoPlay: false,
        controlsVisibleAtStart: true,
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
                      'Hướng dẫn sử dụng',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  SizedBox(height: Sizes.padding_vertical.h),
                  YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                    onReady: () {
                      print('Player is ready.');
                    },
                  ),
                  SizedBox(height: Sizes.padding_vertical.h),

                  Center(
                      child: Image.asset('assets/png/home.png', height: 350)),
                  SizedBox(height: Sizes.padding_vertical.h),
                  Text(
                    '- Tùy khả năng và nhu cầu, học sinh sẽ chọn và nhấn vào nội dung cần thực hiện.',
                  ),
                  Text(
                    '- Trong từng dạng bài, nếu hoàn thành 10 bài thì sẽ có 1 lần ghi nhận số điểm đạt được.',
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        '- Sau đó nếu muốn rèn luyện',
                      ),
                      Text(' tiếp'),
                      Text(' dạng'),
                      Text(' toán'),
                      Text(' đó'),
                      Text(' thì'),
                      Text(' nhấn'),
                      Text(' vào'),
                      Image.asset('assets/png/re.png', height: 30),
                      Text(' , sẽ '),
                      Text('có '),
                      Text('những '),
                      Text('bài '),
                      Text('toán '),
                      Text('khác '),
                      Text('để '),
                      Text('thực '),
                      Text('hiện. '),
                      Text('Muốn '),
                      Text('trở '),
                      Text('về '),
                      Text('màn '),
                      Text('hình '),
                      Text('chính '),
                      Text('thì '),
                      Text('nhấn '),
                      Text('vào '),
                      Image.asset('assets/png/more.png', height: 30),
                    ],
                  ),
                  SizedBox(height: Sizes.padding_vertical.h),
                  Center(
                      child: Image.asset('assets/png/result.png', height: 350)),
                  SizedBox(height: Sizes.padding_vertical.h),
//Phần đếm
                  buildButton(
                    context: context,
                    onTap: () {
                      Get.to(NaturalNumberGuide());
                    },
                    title: 'Hướng dẫn phần đếm',
                  ),

                  //Phần so sánh
                  buildButton(
                    context: context,
                    onTap: () {
                      Get.to(CompareGuide());
                    },
                    title: 'Hướng dẫn phần so sánh',
                  ),

                  //Phần cộng trừ nhân chia
                  GestureDetector(
                    onTap: () {
                      Get.to(OtherGuide());
                    },
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
                            'Hướng dẫn phần cộng, trừ, nhân, chia',
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                            maxLines: 1,
                          )),
                        ),
                      ],
                    ),
                  )
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
