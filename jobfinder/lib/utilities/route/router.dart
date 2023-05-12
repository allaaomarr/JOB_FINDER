import 'package:flutter/material.dart';
import 'package:jobfinder/View/applied_jobs/applied_jobs.dart';
import 'package:jobfinder/View/home_search/home_page.dart';
import 'package:jobfinder/View/login_page/login_page.dart';
import 'package:jobfinder/View/messages/messages.dart';
import 'package:jobfinder/View/notification/notification.dart';
import 'package:jobfinder/View/profile/profile_page.dart';
import 'package:jobfinder/View/register_pages/register_page.dart';
import 'package:jobfinder/View/saved_jobs/saved_jobs.dart';
import 'package:jobfinder/utilities/route/routes.dart';
import '../../View/Splash.dart';
import '../../View/onboarding.dart';


Route<dynamic> onGenerate(RouteSettings routeSettings){

  switch(routeSettings.name){
    case AppRoutes.splashPageRoute:
      return MaterialPageRoute(builder: (_)=> splash(),
      settings:  routeSettings
      );
    case AppRoutes.onBoardingRoute:
      return MaterialPageRoute(builder: (_)=>
      onboarding(),
      settings: routeSettings
      );
    case AppRoutes.registerPageRoute:
      return MaterialPageRoute(builder: (_)=> register_page(),
          settings: routeSettings
      );
    case AppRoutes.loginRoute:
   return MaterialPageRoute(builder: (_)=> login_page(),
          settings: routeSettings
      );
   // case AppRoutes.homePageRoute:
   //   return MaterialPageRoute(builder: (_)=> home_page(),
   //       settings: routeSettings
   //   );
    case AppRoutes.messagesPageRoute:
      return MaterialPageRoute(builder: (_)=> messages(),
          settings: routeSettings
      );
    case AppRoutes.appliedjobsPageRoute:
      return MaterialPageRoute(builder: (_)=> applied_jobs(),
          settings: routeSettings
      );
    case AppRoutes.savedjobsPageRoute:
      return MaterialPageRoute(builder: (_)=> saved_jobs(),
          settings: routeSettings
      );
    case AppRoutes.notificationPageRoute:
      return MaterialPageRoute(builder: (_)=> notification(),
          settings: routeSettings
      );
    case AppRoutes.profilePageRoute:
    default:   return MaterialPageRoute(builder: (_)=> profile_page(),
          settings: routeSettings
      );


  }

}