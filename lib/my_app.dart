import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/core/application/navigation_service.dart';
import 'package:flutter_boilerplate_code/src/resources/app_themes.dart';
import 'package:flutter_boilerplate_code/src/routes/router_helper.dart';
import 'package:flutter_boilerplate_code/src/routes/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'di_container.dart';

class MyApp extends StatefulWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final NavigationService navigationService = sl();


  @override
  void initState() {
    super.initState();
    RouterHelper().setupRouter();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, app) {
        return MaterialApp(
          navigatorKey: navigationService.navigatorKey,
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            return ScrollConfiguration(
              //Removes the whole app's scroll glow
              behavior: AppBehavior(),
              child: child!,
            );
          },
          title: 'MuseIQ',
          themeMode: ThemeMode.dark,
          theme: buildDarkTheme(context),
          initialRoute: Routes.homeScreen,
          onGenerateRoute: RouterHelper.router.generator,
        );
      },
    );
  }
}

//to avoid scroll glow in whole app
class AppBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context,
      Widget child,
      AxisDirection axisDirection,
      ) {
    return child;
  }
}