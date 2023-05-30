import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:jobfinder/View/applied_jobs/complete_apply.dart';
import 'package:jobfinder/View/complete_profile/complete_profile.dart';
import 'package:jobfinder/View/widgets/arrowback_title.dart';
import 'package:jobfinder/View/widgets/title_container.dart';
import 'package:jobfinder/utilities/app_strings.dart';
import 'package:linear_step_indicator/linear_step_indicator.dart';
import 'package:sizer/sizer.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../styles/app_theme.dart';
import '../../utilities/app_images.dart';
import '../home_search/home_page.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/headers.dart';

class applied_jobs extends StatefulWidget {
  const applied_jobs({Key? key}) : super(key: key);

  @override
  State<applied_jobs> createState() => _applied_jobsState();
}
int _currentStep= 0;
List<Step> _steps = [
  Step(
    title: Text('Step 1'),
    content: Container(
      // Step 1 content
    ),
  ),
  Step(
    title: Text('Step 2'),
    content: Container(
      // Step 2 content
    ),
  ),
  // Add more steps as needed
];
final pageController = PageController();
int initialPage = 0;
class _applied_jobsState extends State<applied_jobs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : SafeArea(child: Column(
        children: [
arrowback_title(title: AppStrings.AppliedJob),
          ToggleSwitch(
            minWidth: 160.0.sp,
            cornerRadius: 20.0,
            minHeight: 35.sp,
            activeBgColors: [
              [AppTheme.darkblue],
              [AppTheme.darkblue]
            ],
            activeFgColor: Colors.white,
            inactiveBgColor: AppTheme.unclickedbackground,
            inactiveFgColor: AppTheme.unclickedColor,
            initialLabelIndex: 1,
            totalSwitches: 2,
            labels: [AppStrings.Active, AppStrings.Rejected],
            radiusStyle: true,
            onToggle: (index) {
              print('switched to: $index');
            },
          ),
          SizedBox(
            height: 20,
          ),
          title_container(title: AppStrings.Appliedjobs),

          Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return
                    InkWell(
                      onTap: (){
Navigator.push(context,MaterialPageRoute(builder: (context) => complete_apply(),));
                  },
                  child:  Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
                            child: Container(
                              height: 200.sp,
                              width: 266.sp,
                              // color: Colors.red,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 20),
                                        child: Image.asset(
                                          AppImages.twitter,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        children: [
                                          headers(
                                            header1: "UI/UX Designer",
                                            header2: "Twitter • Jakarta, Indonesia ",
                                            haeder2size: 10,
                                            header1size: 15,
                                            sizedbox: 4.5,
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Image.asset(AppImages.save),
                                    ],
                                  ),

                                  Row(
                                    children: [
                                      keywordss('Fulltime'),
                                      SizedBox(width: 5,),
                                      keywordss('Remote'),


                                      SizedBox(width: 10,),
                                      Spacer(),

                                      Text("Posted 2 days ago",style: TextStyle(color: AppTheme.unclickedColor, fontWeight: FontWeight.w500,fontSize: 10.sp),textAlign: TextAlign.end),
                                    ///TODO  stepper

             
                                    ],
                                  ),

                                   // flex:2,
                               /*    Container(


                                      decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(5),
                                        border: Border.all(
                                          color: AppTheme.unclickedColor
                                        )

                      ),

                                      child:    FullLinearStepIndicator(
                                        steps: 3,
                                        lineHeight: 1.5,
iconSize: 5,nodeSize: 0,
                                        activeNodeColor: Colors.brown,
                                        inActiveNodeColor: const Color(0xffd1d5d8),
                                        activeLineColor: Colors.brown,
                                        inActiveLineColor: const Color(0xffd1d5d8),
                                        backgroundColor: Colors.transparent,
                                        controller: pageController,
                                        labels: List<String>.generate(3, (index) => "Step ${index + 1}"),
                                        complete: () {
                                          //typically, you'd want to put logic that returns true when all the steps
                                          //are completed here
                                          return Future.value(true);
                                        },
                                      ),

               /*  EasyStepper(
                                        activeStep: activeStep,

                                        lineLength: 20,
                                        steppingEnabled: true,
                                        padding: 0,
                                        stepRadius:8,
                                        finishedStepBorderColor: AppTheme.PrimaryColor,
                                        finishedStepTextColor: AppTheme.PrimaryColor,
                                        finishedStepBackgroundColor:AppTheme.PrimaryColor,
                                        activeStepIconColor:Colors.white,
                                        activeStepBackgroundColor: AppTheme.PrimaryColor,
                                        activeStepTextColor:AppTheme.PrimaryColor ,

                                        steps: const [
                                          EasyStep(
                                            icon: Icon(CupertinoIcons.number),
                                            title: AppStrings.biodata,
                                            activeIcon: Icon(CupertinoIcons.check_mark),
                                            finishIcon: Icon(CupertinoIcons.check_mark),

                                          ),
                                          EasyStep(
                                            icon: Icon(Icons.category_rounded),
                                            title: AppStrings.worktype,
                                            activeIcon: Icon(CupertinoIcons.check_mark),
                                            finishIcon: Icon(CupertinoIcons.check_mark),
                                          ),
                                          EasyStep(
                                            icon: Icon(Icons.local_shipping_rounded),
                                            title: AppStrings.uploadportoflio,
                                            activeIcon: Icon(CupertinoIcons.check_mark),
                                            finishIcon: Icon(CupertinoIcons.check_mark),
                                          ),

                                        ],
                                        onStepReached: (index) {
                                          activeStep = index;
                                          setState(() { //for (int i = 0; i < _selectedstep.length; i++) {
                                            //  _selectedstep[i] = i == index;}

                                          });},
                                      ),*/

                                  ),*/
                               //   SizedBox(width: 10,),
                                  Divider(
                                    thickness: 1.5,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                    );
                },
              )),

        ],
      ),

      ),
        bottomNavigationBar: bottom_nav_bar(currentIndex: 2,),
    );
  }
}
