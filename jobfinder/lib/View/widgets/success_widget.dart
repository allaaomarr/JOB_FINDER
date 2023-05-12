import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../styles/app_theme.dart';
import '../../utilities/app_images.dart';
import 'main_button.dart';

class success_widget extends StatefulWidget {

  String? buttontext;
  String header1;
  String header2;
  String image;
  double headersize1;
  double headersize2;
  double sizebox1;
  double sizebox2;
  success_widget({ this.buttontext,required this.header1 ,required this.header2 , required this.image,this.headersize1=17.5,this.headersize2=12,this.sizebox1=30,this.sizebox2=15});
  @override
  State<success_widget> createState() => _success_widgetState();
}

class _success_widgetState extends State<success_widget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(widget.image,),
        SizedBox(height: widget.sizebox1,),

     Text(widget.header1, style: TextStyle(fontSize:widget.headersize1.sp ,fontWeight: FontWeight.w500, ),textAlign:TextAlign.center,),
        SizedBox(height: widget.sizebox2,),
        Text(widget.header2,style: TextStyle(fontSize: widget.headersize2.sp,color: AppTheme.lightunclickedColor),textAlign:TextAlign.center,),
        //Spacer(),
      /*  InkWell(
          onTap: (){},
          child: main_button(label: widget.buttontext ,),
        ),*/
      ],
    );
  }
}
