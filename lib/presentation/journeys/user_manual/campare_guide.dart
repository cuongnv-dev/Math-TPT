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
                      'Hướng dẫn phần so sánh',
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
                  Text('Gồm 4 dạng '),
                  Text('Chọn dạng bài rồi ấn vào “bắt đầu” '),
                  SizedBox(height: Sizes.padding_vertical.h),
                  //Bài 1
                  Text('1. Chọn số lớn hơn, bé hơn:',
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
                    '- Có 2 số được hiển thị dưới màn hình, phía trên là biểu tượng biểu thị cho số đó. Chọn đáp án đúng bằng cách nhấn vào số lớn hơn hay bé hơn theo yêu cầu đề bài. Chú mèo sẽ đồng hành xác định kết quả đúng sai.',
                  ),
                  Text(
                    '- Kết quả đúng sẽ có mũi tên hiện ra, ấn vào mũi tên để sang bài tiếp theo.',
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
                  //Bài 2
                  Text('2. Chọn số lớn lớn nhất, bé nhất',
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
                    '- Có 3 số được hiển thị bên cạnh 3 hình biểu tượng cho số đó. Chọn đáp án đúng bằng cách nhấn vào số lớn nhất hoặc bé nhất (tùy yêu cầu đề bài) trong 3 số. Chú mèo sẽ đồng hành xác định kết quả đúng sai.',
                  ),
                  Text(
                    '- Kết quả đúng sẽ có mũi tên hiện ra, ấn vào mũi tên để sang bài tiếp theo.',
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
                  //Bài 3
                  Text('3. Điền dấu',
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
                    '- Các dấu >, <, = được hiện ra phía dưới màn hình. Quan sát hình biểu tượng và chọn dấu thích hợp kéo thả vào ô vuông có dấu chấm hỏi. Chú mèo sẽ đồng hành xác định kết quả đúng sai.',
                  ),
                  Text(
                    '- Kết quả đúng dấu mũi tên sẽ hiển thị, ấn vào mũi tên để sang bài tiếp theo.',
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
