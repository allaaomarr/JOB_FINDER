import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../styles/app_theme.dart';
import '../../utilities/app_strings.dart';
import '../login_page/login_page.dart';

class other_options extends StatefulWidget {
Widget? page;
  String option ;
      String buttontext;
  other_options({required this.option,required this.buttontext,this.page});
  @override
  State<other_options> createState() => _other_optionsState();
}

class _other_optionsState extends State<other_options> {
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(widget.option,style: TextStyle(color: AppTheme.lightunclickedColor),textAlign: TextAlign.center,),
        //    Spacer(),
        TextButton( onPressed: () {  Navigator.push(context, MaterialPageRoute(builder: (context) =>widget.page!,),);
           },
          child: Text(widget.buttontext,style : TextStyle(color:AppTheme.PrimaryColor),textAlign: TextAlign.center,),),

      ],
    );
  }
}
