import 'package:flutter/material.dart';
import 'package:math/common/constants/size_constants.dart';
import 'package:math/presentation/journeys/home/home_screen.dart';
import '../../common/extensions/size_extensions.dart';
import '../themes/theme_text.dart';
import 'package:get/get.dart';

class IndexScreen extends StatefulWidget {
  // 'assets/png/home1.jpg'
  @override
  _IndexScreenState createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  final homeBackground = AssetImage("assets/png/home1.jpg");

  @override
  void didChangeDependencies() {
    precacheImage(homeBackground, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: Sizes.padding_vertical.h * 3,
            horizontal: Sizes.padding_horizontal.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/png/logo.jpg',
                width: 170,
                height: 170,
              ),
              SizedBox(
                height: Sizes.padding_vertical.h,
              ),
              Text(
                'Math - TPT',
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: Colors.black),
              ),
              SizedBox(
                height: Sizes.padding_vertical.h * 2,
              ),
              Text(
                'Math – TPT  là sản phẩm do nhóm sinh viên nghiên cứu khoa học Khoa Giáo dục Đặc biệt – trường Đại học Sư phạm TP.HCM nghiên cứu và thực hiện. ',
                style: Theme.of(context).textTheme.subtitle2,
                textAlign: TextAlign.center,
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Get.to(HomeScreen());
                },
                child: Stack(
                  children: [
                    Container(
                      width: Sizes.dimen_300.w,
                      height: Sizes.dimen_24.h,
                      decoration: BoxDecoration(
                        color: Colors.green[700],
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    Container(
                      width: Sizes.dimen_300.w,
                      height: Sizes.dimen_20.h,
                      decoration: BoxDecoration(
                        color: Colors.green[400],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                          child: Text('Bắt đầu ngay',
                              style:
                                  Theme.of(context).textTheme.whiteBoldHeadline6
                              // .copyWith( ),
                              )),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Sizes.padding_vertical.h),
              GestureDetector(
                onTap: () {},
                child: Stack(
                  children: [
                    Container(
                      width: Sizes.dimen_300.w,
                      height: Sizes.dimen_24.h,
                      decoration: BoxDecoration(
                        color: Colors.blue[700],
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    Container(
                      width: Sizes.dimen_300.w,
                      height: Sizes.dimen_20.h,
                      decoration: BoxDecoration(
                        color: Colors.blue[400],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                          child: Text('Hướng dẫn',
                              style:
                                  Theme.of(context).textTheme.whiteBoldHeadline6
                              // .copyWith( ),
                              )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
