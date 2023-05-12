import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../styles/app_theme.dart';

class transparent_button extends StatefulWidget {


  String label;
  Function? onpressed;
  Color? color;
  Color? textcolor;
  Image image;
 transparent_button({required this.label, this.onpressed,this.color = Colors.transparent,this.textcolor=Colors.black,required this.image});

  @override
  State<transparent_button> createState() => _transparent_buttonState();
}

class _transparent_buttonState extends State<transparent_button> {
  @override
  Widget build(BuildContext context) {
    return Container(

      height: 50,
      width: 152,

      child: Padding(
        padding: const EdgeInsets.all(10),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.image,

            SizedBox(width: 6,),
              Text(widget.label,style: TextStyle(color: widget.textcolor,fontSize: 15,fontWeight: FontWeight.w500),),
            ],
          ),

     ),
      decoration: BoxDecoration(
        color:  widget.color,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppTheme.lightunclickedColor
        )
      ),

    );
  }
}
