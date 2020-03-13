import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:retina/app_providers.dart';
import 'package:retina/app_routes.dart';
import 'package:retina/screens/home.dart';
import 'package:retina/themes/dark_theme.dart';
import 'package:retina/themes/light_theme.dart';
import 'package:retina/routing/json_valhalla.dart';

void main() => runApp(MyApp());
//void main() async{
//  String shape = "gjhoqAdz}lwC]?O??|@?l@?l@kA?}@?]L{A?e@?e@?Fl@?\\?jB?jA?zA?l@FhB?l@O?cA?";
//  //long lat
//  List<double> start = [-79.92057,43.258549];
//  List<double> end  = [-79.920914,43.258778];
//
//  String shapeex = await fetchRouteFromNetwork(start,end);
//
//  print(shapeex);
//  List<List<double>> coord = polylineDecode(shapeex);
//  print(coord);
//
//}
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
