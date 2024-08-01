import 'package:flutter/material.dart';
import 'package:city_guide_project/Constants/App_Colors.dart';

class customTextFields extends StatelessWidget {

  final String labelText;
  final IconData icon;
  TextEditingController controller;
  customTextFields({ Key? key, required this.labelText, required this.icon,required this.controller,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 2, style: BorderStyle.solid, color: AppColors.Pixiegreen,),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, style: BorderStyle.solid, color: AppColors.green,),
        ),
        prefixIcon: Icon(icon),
        labelText: labelText,
      ),
    );
  }
}