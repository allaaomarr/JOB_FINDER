import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobfinder/View/onboarding.dart';
import 'package:jobfinder/utilities/app_images.dart';
import 'package:sizer/sizer.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  bool loading = true;
  @override
  void initState() {
    super.initState();

    Timer(
      Duration(seconds: 5),
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>onboarding(),
        ),
      ),
    );
  }

  /*void initState() {
    super.initState();
    Timer(const Duration(seconds: 4),
        MyCache.getBool(key: MyCacheKey.onBoarding)==false?
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
            const OnBoardingScreen()
            ))
            :  ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
            const HomePage()
            )
        )
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body:
         Center(
           child: Stack(
             children: [
               Positioned(

                   child: Image.asset(AppImages.splashbackground,color: Color(0xffD6E4FF),width: 500.sp,)),
               Positioned(
                   top: 80.sp,
                   left: 30.sp,
                   right: 30.sp,
                   bottom: 80.sp,
                   child: Image.asset("images/Logo.png",height: 100.sp,width:100.sp,)),
             ],
           ),
         ),

    );
  }
}
