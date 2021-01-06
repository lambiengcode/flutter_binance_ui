import 'package:binance/src/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: 'Binance JEX',
      debugShowCheckedModeBanner: false,
      initialRoute: '/root',
      defaultTransition: Transition.native,
      locale: Locale('vi', 'VN'),
      getPages: [
        GetPage(name: '/root', page: () => App()),
      ],
    ),
  );
}
