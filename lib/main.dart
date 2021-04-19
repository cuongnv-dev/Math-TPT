import 'package:flutter/material.dart';
import 'package:get/get_core/src/smart_management.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:math/common/routes/bindings/home_binding.dart';
import 'package:math/presentation/themes/theme_color.dart';
import 'common/extensions/size_extensions.dart';
import 'package:math/presentation/themes/theme_text.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'common/constants/size_constants.dart';
import 'common/routes/bindings/initial_binding.dart';
import 'common/routes/pages.dart';
import 'common/routes/routers.dart';
import 'common/screenutil/screenutil.dart';

void main() async {
  await GetStorage.init();

  final appDirectory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDirectory.path);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();

    return GetMaterialApp(
      title: 'Math Playground',
      theme: ThemeData(
        primaryColor: AppColor.lightBlue,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Coiny',
        // textTheme: TextTheme(headline2: TextStyle(fontSize: Sizes.dimen_.sp),),
        textTheme: ThemeText.getTextTheme(),
        appBarTheme: const AppBarTheme(elevation: 0),
      ),
      smartManagement: SmartManagement.full,
      initialBinding: HomeBinding(),
      initialRoute: Routers.home,
      getPages: Pages.getPages,
      debugShowCheckedModeBanner: false,
    );
  }
}
