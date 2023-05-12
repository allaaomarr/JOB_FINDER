import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobfinder/styles/app_theme.dart';
import 'package:sizer/sizer.dart';

class main_button extends StatefulWidget {

  String label;
  Function? onpressed;
  Color? color;
  Color? textcolor;
  main_button({required this.label, this.onpressed,this.color = AppTheme.PrimaryColor,this.textcolor=Colors.white});
  @override
  State<main_button> createState() => _buttonState();
}

class _buttonState extends State<main_button> {

  @override
  Widget build(BuildContext context) {
    return
      Container(

        height: 40,
        width: 350,

        child: Center(child: Text(widget.label,style: TextStyle(color: widget.textcolor,fontSize: 15),)),
        decoration: BoxDecoration(
          color:  widget.color,
          borderRadius: BorderRadius.circular(20),
        ),

    );
  }
}
