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
                      'Hướng dẫn phần cộng, trừ, nhân, chia',
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
                  Text('Gồm 4 dạng '),
                  Text('Chọn dạng bài rồi ấn vào “bắt đầu” '),
                  SizedBox(height: Sizes.padding_vertical.h),
                  //Bài 1
                  Text('1. Chọn đáp án đúng',
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
                    '-Có 3 số được hiển thị dưới màn hình, quan sát hình hiển thị sau đó tính và chọn đáp án đúng bằng cách nhấn vào số đó. ',
                  ),
                  Text(
                    '- Chú mèo sẽ đồng hành xác định kết quả đúng sai. Kết quả đúng sẽ có mũi tên hiện ra, ấn vào mũi tên để sang bài tiếp theo.',
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
                  //Bài 2
                  Text('2. Chọn phép tính đúng',
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
                    '- Có 4 phép tính hiện ra phía dưới màn hình. Quan sát hình hiển thị rồi chọn phép tính tương ứng, sau đó kéo thả vào ô vuông có dấu chấm hỏi. Nếu chọn  phép tính sai thì không đặt vào ô vuông được. Nếu chọn đúng phép tính đúng  thì chú mèo vui vẻ và mũi tên sẽ hiện ra, nhấn vào mũi tên để sang bài tiếp theo.',
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
                  //Bài 3
                  Text('3. Viết phép tính',
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
                    '- Bên trái là biểu tượng, bên phải là phép tính dọc. Quan sát hình, viết phép tính và tính bằng cách ấn vào ô vuông trống (ô vuông hiển thị màu vàng) sau đó ấn vào số thích hợp phía dưới màn hình hoàn thành hết ô trống.',
                  ),
                  Text(
                    '- Chú mèo sẽ đồng hành kiểm tra két quả đúng, sai. Kết quả đúng sẽ có mũi tên hiện ra, ấn vào mũi tên để sang bài tiếp theo.',
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
                  //Bài 4
                  Text('4. Giải toán có lời văn',
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
                    '- Ở dạng toán này có 3 phần: phần 1 đề bài; phần 2 viết phép tính, phần 3 viết câu trả lời.',
                  ),
                  Text(
                    '- Đọc đề bài sau đó ấn vào ô vuông còn trống (ô vuông đó sẽ hiện màu vàng) chọn số thích hợp bằng cách nhấn vào số bên dưới màn hình để hoàn thành phép tính. Sau khi điền xong các ô trống, ấn vào “Kiểm tra”.',
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
                    '- Đọc đề bài sau đó ấn vào ô vuông còn trống (ô vuông đó sẽ hiện màu vàng) chọn số thích hợp bằng cách nhấn vào số bên dưới màn hình để hoàn thành phép tính. Sau khi điền xong các ô trống, ấn vào “Kiểm tra”.',
                  ),
                  Text(
                      '- Kết quả đúng thì ô số hiện màu xanh và chữ “tiếp tục”, ấn vào “tiếp tục” để sang bài tiếp theo. Kết quả sai thì ô vuông hiện màu đỏ, nhấn vào ô sai sau đó chọn lại số thích hợp. '),
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
