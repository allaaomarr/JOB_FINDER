import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../styles/app_theme.dart';
import '../../../utilities/app_sizes.dart';
import '../../../utilities/app_strings.dart';
import '../../widgets/arrowback_title.dart';
import '../../widgets/headers.dart';

class terms_conditions extends StatefulWidget {
  const terms_conditions({Key? key}) : super(key: key);

  @override
  State<terms_conditions> createState() => _terms_conditionsState();
}

class _terms_conditionsState extends State<terms_conditions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            arrowback_title(title: AppStrings.  TermsandConditions,),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [

                  headers(header1: AppStrings.termsandcondtionstitle, header2: AppStrings.termsandcondtionsdetails,header1size: AppSizes.title1,haeder2size: AppSizes.title2,sizedbox2: 15,),


                  headers(header1: AppStrings.termsandcondtionstitle, header2: AppStrings.termsandcondtionsdetails2,header1size: AppSizes.title1,haeder2size: AppSizes.title2,sizedbox2: 15,),
                  Container(

                      decoration: BoxDecoration(
                      //  borderRadius: BorderRadiusDirectional.circular(10),
                        color:  AppTheme.titlecontainer,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(AppStrings.termsandcondtionsdetails3,style: TextStyle(fontSize:AppSizes.title2.sp ,color: AppTheme.unclickedColor,fontWeight: FontWeight.w400),),
                      )),
                  SizedBox(height: 15,),
                  Text(AppStrings.termsandcondtionsdetails4,style: TextStyle(fontSize:AppSizes.title2.sp ,color: AppTheme.unclickedColor,fontWeight: FontWeight.w400),),
                ],
              ),
            ),

          ],
        ),
      ),
    ));
  }
}
