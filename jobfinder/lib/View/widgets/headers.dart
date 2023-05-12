import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../styles/app_theme.dart';
import '../../utilities/app_strings.dart';

class headers extends StatefulWidget {
  String header1;
  String header2;
  double? header1size;
  double? haeder2size;
  Color? color;
  double? sizedbox;
  double? sizedbox2;
  CrossAxisAlignment align ;
  AlignmentDirectional align2;
  double? width;

  headers({required this.header1,required this.header2,this.header1size =23,this.haeder2size =13.5,this.color= Colors.black,this.sizedbox =10,this.align= CrossAxisAlignment.center,this.align2 =AlignmentDirectional.topStart,this.sizedbox2=20,this.width});

  @override
  State<headers> createState() => _headersState();
}

class _headersState extends State<headers> {
  @override
  Widget build(BuildContext context) {
    return Column(
    crossAxisAlignment: widget.align,
      children: [
      Container(
        alignment: widget.align2,
          child:
              Text(widget.header1,style: TextStyle(fontSize:widget.header1size?.sp ,fontWeight: FontWeight.w500,color: widget.color ),),


          ),
    SizedBox(height: widget.sizedbox?.sp,),

    Container(
          alignment: widget.align2,
width: widget.width,
          child: Text(widget.header2,style: TextStyle(fontSize: widget.haeder2size?.sp,color: AppTheme.unclickedColor,fontWeight: FontWeight.w400),)),

    SizedBox(height: widget.sizedbox2?.sp,),
      ],
    );
  }
}
