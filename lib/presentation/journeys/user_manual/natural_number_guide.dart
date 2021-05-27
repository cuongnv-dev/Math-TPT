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
                      'Hướng dẫn phần đếm',
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
                  Text('Gồm 4 dạng '),
                  Text('Chọn dạng bài rồi ấn vào “bắt đầu” '),
                  SizedBox(height: Sizes.padding_vertical.h),
                  Center(
                      child: Image.asset('assets/png/dem1.png', height: 350)),
                  SizedBox(height: Sizes.padding_vertical.h),
                  Text('1. Chọn số thích hợp:',
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
                    '- Có 3 số được hiển thị dưới màn hình, chọn đáp án đúng bằng cách nhấn vào số đó. ',
                  ),
                  Text(
                    '- Nếu sai sẽ có hình con mèo khóc hiện ra, nhấn chọn lại đáp án khác. Nếu đúng sẽ có hình con mèo vui vẻ xuất hiện và sẽ có mũi tên hiện ra. Nhấn vào mũi tên để sang bài tiếp theo.',
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
                  Text('2. Điền số:',
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
                    '- Có một dãy số, còn trống ở một vài vị trí, nhấn vào vị trí còn thiếu (sau khi ấn vào thì chỗ đó hiện lên màu vàng). Sau đó chọn các số thích hợp ở bên dưới màn hình. Chú mèo vẫn đồng hành xác định kết quả đúng sai.',
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
                  Text('3. Viết số thích hợp:',
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
                    '- Đếm hình có sẵn để chọn các số thích hợp (dãy số từ 1-9 ở bên dưới màn hình) điền vào ô trống tương ứng.',
                  ),
                  Text(
                      '- Kết quả sai ô số sẽ hiện ra màu đỏ, và nhấn chọn lại đáp án khác. Kết quả đúng ô số sẽ hiện màu xanh và có mũi tên hiện ra. Nhấn vào mũi tên để sang bài tiếp theo.'),
                  SizedBox(height: Sizes.padding_vertical.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assets/png/dem6.png', height: 350),
                      Image.asset('assets/png/dem7.png', height: 350)
                    ],
                  ),
                  SizedBox(height: Sizes.padding_vertical.h * 2),
                  Text('4. Sắp xếp theo thứ tự:',
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
                    '- Một dãy số được hiện ra phía dưới màn hình, sắp xếp các số theo yêu cầu (từ lớn đến nhỏ hoặc từ nhỏ đến lớn). Kéo thả số đó vào ô vuông có dấu chấm hỏi. Nếu số chọn không phù hợp với thứ tự dãy số thì sẽ không đặt được số đó vào ô vuông.',
                  ),
                  Text(
                    '- Hoàn thành xong dãy số sẽ có mũi tên hiện ra. Nhấn vào mũi tên để sang bài tiếp theo	',
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
