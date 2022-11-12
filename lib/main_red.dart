import 'package:flavored_app_demo/constants/colors.dart';
import 'package:flavored_app_demo/flavor_config.dart';
import 'package:flavored_app_demo/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlavorConfig(
    flavor: Flavor.red,
    color: Colors.red,
    name: 'Red Flavor App',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo - Red',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: ColorValues.scaffoldColor,
        cardColor: ColorValues.cardColor,
        textTheme: const TextTheme(
          subtitle1: TextStyle(
            color: Color.fromARGB(255, 100, 100, 100),
          ),
        ),
      ),
      getPages: AppPages.pages,
      initialRoute: AppRoutes.home,
    );
  }
}
