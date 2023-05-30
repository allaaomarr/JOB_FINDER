
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jobfinder/Controller/Provider/complete_profile_provider.dart';
import 'package:jobfinder/Controller/Provider/saved_jobs_provider.dart';
import 'package:jobfinder/View/Splash.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'Controller/Provider/firebase_provider.dart';
import 'Controller/Provider/home_provider.dart';
import 'Controller/Provider/login_provider.dart';
import 'Controller/Provider/profile_provider.dart';
import 'Controller/Provider/register_provider.dart';
import 'Controller/Provider/search_provider.dart';
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
               ChangeNotifierProvider(create: (context)=> ProfileProvider()),
             ],



             builder: (context, child) {
   return  MaterialApp(

home:

splash(),debugShowCheckedModeBanner: false,);
       //),
          },);
    },

  ));

}
