import 'package:aakscience_test/appStyle/theme_data.dart';
import 'package:flutter/material.dart';
class ButtonWidget extends StatelessWidget {
  final double minWidth;
  final Function onTap;
  final Widget text;
   const ButtonWidget({super.key,this.minWidth=100,required this.onTap,required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: minWidth,
      onPressed: () => onTap(),
      height: 50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.teal),
      ),
      color: Colors.teal,
      child: text,
    );
  }
}
