
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:jobfinder/View/complete_profile/education.dart';
import 'package:jobfinder/View/complete_profile/experience.dart';
import 'package:jobfinder/View/complete_profile/personal_details.dart';
import 'package:jobfinder/View/complete_profile/portfolio.dart';
import 'package:jobfinder/View/widgets/arrowback_title.dart';
import 'package:jobfinder/View/widgets/headers.dart';
import 'package:jobfinder/styles/app_theme.dart';

import 'package:jobfinder/utilities/app_sizes.dart';
import 'package:jobfinder/utilities/app_strings.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class complete_profile extends StatefulWidget {
  const complete_profile({Key? key}) : super(key: key);

  @override
  State<complete_profile> createState() => _complete_profileState();
}
int activeStep = 0;
bool donecheckmark = true;
bool donecontainer = true;
class _complete_profileState extends State<complete_profile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              arrowback_title(title: AppStrings.CompleteProfile),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    new CircularPercentIndicator(
                      radius: 55.0,
                      lineWidth: 7.0,
                      percent: 0.5,
                      center: new Text("50%",style: TextStyle(color: AppTheme.PrimaryColor,fontWeight: FontWeight.w500,fontSize: 25),),
                      progressColor: AppTheme.PrimaryColor,
                    ),
                    SizedBox(height: 10,),
                    Text(AppStrings.Completed,style: TextStyle(color: AppTheme.PrimaryColor,fontWeight: FontWeight.w400,fontSize:AppSizes.title1)),
                    SizedBox(height: 10,),
                    Text(AppStrings.CompleteProfiledetails,style: TextStyle(color: AppTheme.unclickedColor,fontWeight: FontWeight.w400,fontSize:AppSizes.title1)),
                  ],
                ),
              ),
             InkWell(
                 onTap: (){
                   Navigator.push(
                       context,
                       MaterialPageRoute(
                         builder: (context) => personal_details(),
                       ));
                 },
                 child: step(AppStrings.PersonalDetails, AppStrings.PersonalDetailsdetails)),
          InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>education(),
                    ));
              },
              child:
              step(AppStrings.Education, AppStrings.Educationdetails)),
          InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => experience(),
                    ));
              },
              child:
              step(AppStrings.Experience, AppStrings.Experiencedetails)),
          InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => portfolio(),
                    ));
              },
              child:
              step(AppStrings.Portfolio, AppStrings.Portfoliodetails)),
          ]
      ),
        ),
    )

        );

  }
}
 Widget step(String header1,String header2){
  return Padding(
    padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
    child: Container(
decoration: BoxDecoration(
  borderRadius: BorderRadiusDirectional.circular(10),
    border:Border.all(
      width: 1.5,
      color: AppTheme.unclickedbuttonColor
    )
),
child: Padding(
    padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
    child:   Row(

     children: [

    Icon(Icons.check_circle,color: AppTheme.unclickedbuttonColor,size: 25,),

  SizedBox(width: 20,),
            Expanded(child: Container(child: headers(header1: header1, header2: header2,header1size: 15,haeder2size: 10,align: CrossAxisAlignment.start,align2: AlignmentDirectional.topStart,sizedbox2: 0,sizedbox:6,))),



       // Image.asset(AppImages.arrowforward,),
     Icon(Icons.arrow_forward,color: AppTheme.unclickedbuttonColor,size: 25,),


   ],

  ),
),
    ),
  );
 }