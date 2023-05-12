import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobfinder/styles/app_theme.dart';
import 'package:sizer/sizer.dart';

class title_container extends StatefulWidget {
  String title;
  TextAlign? align;
 title_container({required this.title,this.align =TextAlign.start});

  @override
  State<title_container> createState() => _title_containerState();
}

class _title_containerState extends State<title_container> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.sp,
      height: 30.sp,


decoration: BoxDecoration(
    color: AppTheme.titlecontainer,
  border:  Border.all(
      color: AppTheme.bordertitlecontainer,
  )
),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
        child: Text(widget.title,style: TextStyle(color: AppTheme.unclickedColor),textAlign: widget.align,),
      ),

    );
  }
}
