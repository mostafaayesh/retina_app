import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:retina/app_providers.dart';
import 'package:retina/app_routes.dart';
import 'package:retina/screens/home.dart';
import 'package:retina/themes/dark_theme.dart';
import 'package:retina/themes/light_theme.dart';
import 'package:retina/routing/json_valhalla.dart';
import 'package:retina/routing/json_nominatim.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: app_providers,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: lightTheme,
        darkTheme: darkTheme,
        home: HomeScreen(),
        navigatorKey: Get.key,
        routes: app_routes,
        showSemanticsDebugger: false, // Useful for debugging semantics
      ),
    );
  }
}
