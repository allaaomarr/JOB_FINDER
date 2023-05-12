import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobfinder/View/widgets/success_widget.dart';
import 'package:jobfinder/utilities/app_images.dart';
import 'package:sizer/sizer.dart';

import '../../styles/app_theme.dart';
import '../../utilities/app_strings.dart';
import '../home_search/home_page.dart';
import '../widgets/main_button.dart';

class success_page extends StatelessWidget {

 success_page();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(

          child: Padding(
            padding: const EdgeInsets.all(17),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(children: [
                  IconButton( icon:Icon(Icons.arrow_back),onPressed: (){Navigator.pop(context);},),
                ],),
                Spacer(),
                success_widget(header1: AppStrings.successpagetext, header2: AppStrings.successpagetextdetails, image: AppImages.successicon),
                Spacer(),
                InkWell(
                  onTap: (){
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(
                          builder: (context) => home_page(),));
                  },
                  child: main_button(label: AppStrings.GetStarted ,),
                ),
              ],
            ),
          ),

      ),
    );
  }
}

