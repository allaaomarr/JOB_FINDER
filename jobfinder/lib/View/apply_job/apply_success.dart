import 'package:easy_stepper/easy_stepper.dart';
import 'package:jobfinder/View/home_search/home_page.dart';
import 'package:jobfinder/View/widgets/main_button.dart';
import 'package:jobfinder/View/widgets/success_widget.dart';
import 'package:jobfinder/utilities/app_images.dart';
import 'package:jobfinder/utilities/app_strings.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class apply_success extends StatelessWidget {
  const apply_success({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          child: Column(
           children : [
             Row(
                 children: [
                   IconButton(
                       onPressed: () {
                         Navigator.pop(context);
                       },
                       icon: ImageIcon(
                         AssetImage(AppImages.arrowback),
                       )),
Spacer(),
                   Container(
                     alignment: AlignmentDirectional.center,
                     child: Text(AppStrings.applyjob,
                       style: TextStyle(
                         fontSize: 15.sp,
                         fontWeight: FontWeight.w500,
                       ),textAlign: TextAlign.center,),
                   ),
                   Spacer(),
                   Container(
                     width:30.sp ,
                     child: Text("", textAlign: TextAlign.center,),
                   ),
                  ]),
             Spacer(),
             success_widget(header1: AppStrings.datasuccess, header2:AppStrings.datasuccess1, image :AppImages.datasuccess),
             Spacer(),
             InkWell(
                 onTap: (){
                  // Navigator.push(
                   //    context,
                   //    MaterialPageRoute(
                     //    builder: (context) => home_page(),
                    //   ));
                 },
                 child: main_button(label:AppStrings.backtohome)),
          ]
          ),
        ),
      ),
    );
  }
}
