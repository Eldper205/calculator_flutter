import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:calculator/screen/HomeScreen.dart';
import 'package:calculator/bindings/my_bindings.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      /* Bindings property:
         -> should be 'extended' or 'implemented'
         -> to manage the dependencies () (via Get,put()) or Get.lazyPut()
       */

      // To turn off "DEBUG" banner in debug mode. Intended to deter people
      // from complaining that our app is slow when it's in debug mode.
      debugShowCheckedModeBanner: false,

      initialBinding: MyBindings(),
      title: 'Eldper Calculator',
      home: HomeScreen(),
    );
  }
}
