import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math/common/constants/size_constants.dart';
import 'package:math/common/routes/routers.dart';
import 'package:math/common/screenutil/screenutil.dart';
import 'package:math/presentation/journeys/compare/cate.dart';
import 'package:math/presentation/widgets/menu_button_widget.dart';
import '../../../common/extensions/size_extensions.dart';
import '../../themes/theme_text.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/png/home1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: EdgeInsets.only(top: Sizes.padding_vertical.h * 2),
          color: Colors.black.withOpacity(0.68),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: Sizes.padding_vertical.h),
                  child: Center(
                    child: Text(
                      'Math - TPT',
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    MenuButtonWidget(
                      onPressed: () {
                        return Get.toNamed(Routers.number);
                      },
                      iconPath: 'assets/svg/123-numbers.svg',
                      title: 'Đếm',
                      outsideColor: Colors.purple[400],
                      insideColor: Colors.purple[300],
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(CompareCate());
                      },
                      child: Column(
                        children: <Widget>[
                          Stack(
                            fit: StackFit.loose,
                            children: [
                              Container(
                                width: Sizes.dimen_120,
                                height: Sizes.dimen_120,
                                decoration: BoxDecoration(
                                  color: Colors.orange[700],
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              Container(
                                width: Sizes.dimen_120,
                                height: Sizes.dimen_110,
                                decoration: BoxDecoration(
                                  color: Colors.orange[400],
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: EdgeInsets.all(1),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    '><',
                                    style: Theme.of(context)
                                        .textTheme
                                        .whiteBodyText1
                                        .copyWith(
                                            fontSize: 80.sp,
                                            fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Sizes.dimen_4.h,
                          ),
                          Text(
                            'So Sánh',
                            style: Theme.of(context)
                                .textTheme
                                .boldHeadline5
                                .copyWith(color: Colors.white),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: Sizes.padding_vertical.h * 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    MenuButtonWidget(
                      onPressed: () {
                        Get.toNamed(Routers.plus);
                      },
                      iconPath: 'assets/svg/plus.svg',
                      title: 'Phép Cộng',
                      outsideColor: Colors.red[800],
                      insideColor: Colors.red[400],
                    ),
                    MenuButtonWidget(
                      onPressed: () {
                        Get.toNamed(Routers.minus);
                      },
                      iconPath: 'assets/svg/minus.svg',
                      title: 'Phép Trừ',
                      outsideColor: Colors.green[600],
                      insideColor: Colors.green[400],
                    )
                  ],
                ),
                SizedBox(
                  height: Sizes.padding_vertical.h * 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    MenuButtonWidget(
                      onPressed: () {
                        Get.toNamed(Routers.multiplication);
                      },
                      iconPath: 'assets/svg/unchecked.svg',
                      title: 'Phép Nhân',
                      outsideColor: Colors.yellow[700],
                      insideColor: Colors.yellow[500],
                    ),
                    MenuButtonWidget(
                      onPressed: () {
                        Get.toNamed(Routers.division);
                      },
                      iconPath: 'assets/svg/divide.svg',
                      title: 'Phép Chia',
                      outsideColor: Colors.blue[700],
                      insideColor: Colors.blue[400],
                    ),
                  ],
                ),
                Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
