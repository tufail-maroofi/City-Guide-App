import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:city_guide_project/Screens/Onboard_Screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashState();
}

class _SplashState extends State<SplashScreen> {
    @override
  void initState(){
    super.initState();
    _navigatetohome();
  }

  void _navigatetohome()async {
    await Future.delayed(Duration(seconds: 4),() {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> OnboardScreen()));

}

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: Container(  
            decoration: BoxDecoration(
                       gradient: LinearGradient(
                     begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                       Color.fromRGBO(255, 226, 131, 1),
                     Color.fromARGB(255, 63, 226, 145),
                      ],
                  ),
              ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Logo
            Image.asset("Images/CG Logo a.png", height: 300.w, width: 300.w),
          ],
        ),
      ),
    ),
  );
}
}












