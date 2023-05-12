import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobfinder/View/widgets/headers.dart';
import 'package:jobfinder/utilities/app_sizes.dart';
import 'package:sizer/sizer.dart';

import '../../../styles/app_theme.dart';
import '../../../utilities/app_strings.dart';
import '../../widgets/arrowback_title.dart';

class privacy_policy extends StatefulWidget {
  const privacy_policy({Key? key}) : super(key: key);

  @override
  State<privacy_policy> createState() => _privacy_policyState();
}

class _privacy_policyState extends State<privacy_policy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            arrowback_title(title: AppStrings.PrivacyPolicy,),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [

                  headers(header1: AppStrings.privacyandpolicytitle1, header2: AppStrings.privacyandpolicydetails2,header1size: AppSizes.title1,haeder2size: AppSizes.title2,sizedbox2: 15,),
              Text(AppStrings.privacyandpolicydetails1,style: TextStyle(fontSize:AppSizes.title2.sp ,color: AppTheme.unclickedColor,fontWeight: FontWeight.w400),),
                  SizedBox(height: 15,),
                  headers(header1: AppStrings.privacyandpolicytitle2, header2: AppStrings.privacyandpolicydetails2,header1size: AppSizes.title1,haeder2size: AppSizes.title2,),
                ],
              ),
            ),

          ],
        ),
      ),
    ));
  }
}
