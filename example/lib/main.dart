import 'package:alice_get_connect/alice_get_connect.dart';
import 'package:example/home/home_controller.dart';
import 'package:example/home/home_page.dart';
import 'package:example/home/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _navKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: GetMaterialApp(
        navigatorKey: _navKey,
        title: 'Alice GetConnect Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
        initialBinding: BindingsBuilder((){
          Get.put(AliceGetConnect(navigatorKey: _navKey));
          Get.put(HomeProvider(Get.find()));
          Get.put(HomeController(Get.find()));
        }),
      ),
    );
  }
}
