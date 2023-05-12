
import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';
import 'package:jobfinder/View/register_pages/register_page.dart';
import 'package:jobfinder/styles/app_theme.dart';
import 'package:jobfinder/utilities/app_images.dart';
import 'package:sizer/sizer.dart';

import '../utilities/app_strings.dart';



class onboarding extends StatefulWidget {
  @override
  _onboardingState createState() => _onboardingState();
}

class _onboardingState extends State<onboarding> {
  final PageController _pageController = PageController();


  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(0),

            /*  Row(
                children: [
                  Image.asset("images/Logo.png",height: 20.sp,width: 50.sp,),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      // print('skipButton pressed');
                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(color: AppTheme.unclickedColor),
                    ),
                  ),
                ],
              ),*/
          child:    OnBoard(
                pageController: _pageController,
                // Either Provide onSkip Callback or skipButton Widget to handle skip state
                onSkip: () {
                  // print('skipped');
                },
                // Either Provide onDone Callback or nextButton Widget to handle done state
                onDone: () {
                  // print('done tapped');
                },
                onBoardData: onBoardData,
                titleStyles: const TextStyle(
                  color: AppTheme.PrimaryColor,
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.15,
                ),
                descriptionStyles: TextStyle(
                  fontSize: 12,
                  color: AppTheme.unclickedColor,
                ),
                pageIndicatorStyle: const PageIndicatorStyle(
                  width: 25,
                  inactiveColor: AppTheme.unclickedColor,
                  activeColor: AppTheme.PrimaryColor,
                  inactiveSize: Size(5, 5),
                  activeSize: Size(8, 18),
                ),
                // Either Provide onSkip Callback or skipButton Widget to handle skip state
               skipButton: TextButton(
                  onPressed: () {
                    // print('skipButton pressed');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Row(
                      children: [
                        Image.asset(AppImages.Logo,height: 19.sp,width: 81.sp,),
                        Spacer(),
                        TextButton(
                          onPressed: () {
                            // print('skipButton pressed');
                          },
                          child: const Text(
                            AppStrings.Skip,
                            style: TextStyle(color: AppTheme.unclickedColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Either Provide onDone Callback or nextButton Widget to handle done state
                nextButton: OnBoardConsumer(
                  builder: (context, ref, child) {
                    final state = ref.watch(onBoardStateProvider);
                    return InkWell(
                      onTap: () => state.isLastPage ?  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => register_page(),)): _onNextTap(state),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          width: 327.sp,
                          height: 48.sp,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                           /* gradient: const LinearGradient(
                              colors: [Colors.redAccent, Colors.deepOrangeAccent],
                            ),*/
                            color: AppTheme.PrimaryColor
                          ),
                          child: Text(
                            state.isLastPage ? AppStrings.GetStarted : AppStrings.Next,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

        ),
      );
  }

  void _onNextTap(OnBoardState onBoardState) {
    if (!onBoardState.isLastPage) {
      _pageController.animateToPage(
        onBoardState.page + 1,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOutSine,
      );
    } else {
      //print("nextButton pressed");
    }
  }
}

final List<OnBoardModel> onBoardData = [
  const OnBoardModel(

    title: AppStrings.intro1,
    description: AppStrings.intro1details,
    imgUrl: AppImages.background1,
  ),
  const OnBoardModel(
    title: AppStrings.intro2,
    description: AppStrings.intro2details,
    imgUrl: AppImages.background2,
  ),
  const OnBoardModel(
    title: AppStrings.intro3,
    description: AppStrings.intro3details,
    imgUrl: AppImages.background3,
  ),
];