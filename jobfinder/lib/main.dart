
import 'dart:math';

import 'package:filesystem_picker/filesystem_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jobfinder/Controller/Provider/complete_profile_provider.dart';
import 'package:jobfinder/Controller/Provider/saved_jobs_provider.dart';
import 'package:jobfinder/View/Splash.dart';
import 'package:jobfinder/View/applied_jobs/applied_jobs.dart';
import 'package:jobfinder/View/complete_profile/complete_profile.dart';
import 'package:jobfinder/View/complete_profile/education.dart';
import 'package:jobfinder/View/home_search/home_page.dart';
import 'package:jobfinder/View/home_search/search_page.dart';
import 'package:jobfinder/View/login_page/login_page.dart';
import 'package:jobfinder/View/profile/General/edit_profile.dart';
import 'package:jobfinder/View/profile/General/language.dart';
import 'package:jobfinder/View/register_pages/_choose_location.dart';
import 'package:jobfinder/View/register_pages/register_page.dart';
import 'package:jobfinder/View/saved_jobs/saved_jobs.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'Controller/Provider/firebase_provider.dart';
import 'Controller/Provider/home_provider.dart';
import 'Controller/Provider/login_provider.dart';
import 'Controller/Provider/register_provider.dart';
import 'Controller/Provider/search_provider.dart';
import 'View/apply_job/apply_job.dart';
import 'View/onboarding.dart';
import 'View/register_pages/type_of_work.dart';
import 'firebase_options.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
 options: DefaultFirebaseOptions.currentPlatform,
 );
  runApp(
      Sizer(
    builder:
        (BuildContext context, Orientation orientation, DeviceType deviceType) {
     //  return   FilesystemPickerDefaultOptions(
           //   fileTileSelectMode: FileTileSelectMode.wholeTile,
             // theme: FilesystemPickerTheme(
             //   topBar: FilesystemPickerTopBarThemeData(
             //     backgroundColor: Colors.teal,
             //   ),
            //  ),
       return  MultiProvider(
             providers: [
               // Provider(create: (context)=> HomeProvider()),
               ChangeNotifierProvider(create: (context)=> CompleteProfileProvider()),
               ChangeNotifierProvider(create: (context)=> FirebaseProvider()),
               ChangeNotifierProvider(create: (context)=>LoginProvider()),
               ChangeNotifierProvider(create: (context)=> RegisterProvider()),
               ChangeNotifierProvider(create: (context)=>HomeProvider()),
               ChangeNotifierProvider(create: (context)=> SearchProvider()),
               ChangeNotifierProvider(create: (context)=> SavedJobsProvider()),

             ],



             builder: (context, child) {
   return  MaterialApp(

home:

splash(),);
       //),
          },);
    },

  ));

}
