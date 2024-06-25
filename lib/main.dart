import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'presentation/routes/route_constants.dart';
import 'presentation/routes/routes.dart';
import 'presentation/theme/theme.dart';
import 'utils/setup_app.dart';

void main() async {
  await setupApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Trogon Media Test',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        scaffoldBackgroundColor: whiteColor,
        cardTheme: const CardTheme(
          color: Color(0xffFCFCFC),
        ),
      ),
      initialRoute: RouteList.initial,
      routes: Routes.routes,
    );
  }
}
