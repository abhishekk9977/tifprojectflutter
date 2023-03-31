import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tif_assignment/eventDetail.dart';
import 'package:tif_assignment/helper/eventlist_controller.dart';
import 'package:tif_assignment/home_screen.dart';
import 'package:tif_assignment/search_screen.dart';
import 'package:tif_assignment/helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<EventController>().getEventList();
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
