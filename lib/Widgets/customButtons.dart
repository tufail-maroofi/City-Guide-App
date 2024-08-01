import 'package:flutter/material.dart';
import 'package:city_guide_project/Constants/App_Colors.dart';

class CustomButton extends StatelessWidget {
  String text;
  Color color;
  VoidCallback onTap;
  CustomButton({ Key? key, required this.text, required this.color,required this.onTap,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
      child: Container(
       height: 50,
       width: 160,
       decoration: BoxDecoration(
        border: Border.all(color: AppColors.green),
       borderRadius: BorderRadius.circular(60),
       color: AppColors. green,
       ),
       child:Center(  
      //   child: Text("Get Started",
      //  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      //  ),
       child: Text(text,
       style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
       ),
       ),
      ),
    );
  }
}