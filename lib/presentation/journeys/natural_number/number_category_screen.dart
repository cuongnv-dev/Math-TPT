import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math/presentation/controller/natural_number_category_controller.dart';
import 'package:math/presentation/journeys/natural_number/exercises/fill_number_inside_array/cate.dart';

import 'package:get/get.dart';
import 'package:math/common/constants/size_constants.dart';
import 'package:math/common/routes/routers.dart';
import 'package:math/common/screenutil/screenutil.dart';
import 'package:math/presentation/widgets/back_button_widget.dart';
import 'package:math/presentation/widgets/sub_menu_button_widget.dart';
import '../../../common/extensions/size_extensions.dart';
import 'exercises/sort_exe/cate.dart';

class NaturalNumberScreen extends StatefulWidget {
  @override
  _NaturalNumberScreenState createState() => _NaturalNumberScreenState();
}

class _NaturalNumberScreenState extends State<NaturalNumberScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBarWidget(title: ''),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/png/home3.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: EdgeInsets.only(
            top: Sizes.padding_vertical.h * 3,
            // horizontal: Sizes.padding_horizontal.w * 2,
          ),
          color: Colors.black.withOpacity(0.6),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: Sizes.padding_vertical.h,
                    horizontal: Sizes.padding_horizontal.w,
                  ),
                  child: BackButtonWidget(),
                ),
              ),
              SizedBox(
                height: Sizes.padding_vertical.h,
              ),
              SubMenuButtonWidget(
                title: 'Chọn số thích hợp',
                outsideColor: Colors.lightBlue[700],
                insideColor: Colors.lightBlue[400],
                onPressed: () {
                  setState(() {
                    selectedIndex = 0;
                  });
                },
                selected: selectedIndex == 0,
              ),
              SizedBox(height: Sizes.padding_vertical.h),
              SubMenuButtonWidget(
                title: 'Điền số',
                outsideColor: Colors.lightBlue[700],
                insideColor: Colors.lightBlue[400],
                onPressed: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                },
                selected: selectedIndex == 1,
              ),
              SizedBox(height: Sizes.padding_vertical.h),
              SubMenuButtonWidget(
                title: 'Viết số thích hợp vào ô trống',
                outsideColor: Colors.lightBlue[700],
                insideColor: Colors.lightBlue[400],
                onPressed: () {
                  setState(() {
                    selectedIndex = 2;
                  });
                },
                selected: selectedIndex == 2,
              ),
              SizedBox(height: Sizes.padding_vertical.h),
              SubMenuButtonWidget(
                title: 'Sắp xếp theo thứ tự',
                outsideColor: Colors.lightBlue[700],
                insideColor: Colors.lightBlue[400],
                onPressed: () {
                  setState(() {
                    selectedIndex = 3;
                  });
                },
                selected: selectedIndex == 3,
              ),
              SizedBox(height: ScreenUtil.screenHeight * 0.1),
              GestureDetector(
                onTap: () {
                  switch (selectedIndex) {
                    case 0:
                      Get.toNamed(Routers.choiceNumEx);
                      break;
                    case 1:
                      Get.to(FillArrayCate());
                      break;
                    case 2:
                      Get.toNamed(Routers.fillBlank);
                      break;
                    case 3:
                      Get.to(SortCate());
                      break;
                    default:
                  }
                },
                child: Stack(
                  children: [
                    Container(
                      height: 27.h,
                      width: Sizes.dimen_150.w,
                      decoration: BoxDecoration(
                        color: Colors.orange[800],
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    Container(
                      height: 24.h,
                      width: Sizes.dimen_150.w,
                      decoration: BoxDecoration(
                        color: Colors.orange[400],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'Bắt đầu',
                          style: Theme.of(context).textTheme.headline5.copyWith(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                        ),
                      ),
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
