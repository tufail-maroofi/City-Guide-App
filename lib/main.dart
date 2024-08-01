import 'package:city_guide_project/Auth/Login_Screen.dart';
import 'package:city_guide_project/Auth/Registration_Screen.dart';
import 'package:city_guide_project/Screens/Home_Screen.dart';
import 'package:city_guide_project/Screens/Onboard_Screen.dart';
import 'package:city_guide_project/Screens/Splash_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder:(context, child) =>  MaterialApp(
        debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
      floatingLabelStyle: TextStyle(color: Colors.black),
      ),
      primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      //     routes: {
      //   '/onboard': (context) => OnboardScreen(),
      //   '/login': (context) => LoginScreen(),
      //   '/register': (context) => RegisterScreen(),
      //   '/home': (context) =>  HomeScreen(),
      // },
      )
    );
  }
}
