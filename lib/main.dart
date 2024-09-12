import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/astronaut_controller.dart';
import 'views/astronaut_list_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Space People',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AstronautListView(),
      initialBinding: BindingsBuilder(() {
        Get.put(AstronautController());
      }),
      debugShowCheckedModeBanner: false,
    );
  }
}