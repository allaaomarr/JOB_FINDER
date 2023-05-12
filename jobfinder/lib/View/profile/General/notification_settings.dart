import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:jobfinder/View/widgets/arrowback_title.dart';
import 'package:jobfinder/View/widgets/title_container.dart';
import 'package:jobfinder/styles/app_theme.dart';
import 'package:jobfinder/utilities/app_strings.dart';

 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../utilities/app_images.dart';

class notification_settings extends StatefulWidget {
  const notification_settings({Key? key}) : super(key: key);

  @override
  State<notification_settings> createState() => _notification_settingsState();
}
bool status = false;
class _notification_settingsState extends State<notification_settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                arrowback_title(title:AppStrings.notification),
SizedBox(height: 15,),
title_container(title: AppStrings.Jobnotification),
Padding(
  padding: const EdgeInsets.all(10),
  child:   Column(

    children: [

              settings(AppStrings.YourJobSearchAlert),

      settings(AppStrings.JobApplicationUpdate),

      settings(AppStrings.JobApplicationReminders),

      settings(AppStrings.JobsYouMayBeInterestedIn),

      settings(AppStrings.JobSeekerUpdates),

    ],

  ),
),
                title_container(title: AppStrings.Othernotification),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      settings(AppStrings.ShowProfile),
                      settings(AppStrings.AllMessage),
                      settings(AppStrings.MessageNudges),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
Widget settings ( String title){

  return
    Padding(
      padding: const EdgeInsets.fromLTRB(10,10,10,0),
      child: Container
        (
        child:  Column(
          children: [
            Row(
              children: [

                Text(title,style:TextStyle(fontWeight: FontWeight.w500 ),),
                Spacer(),
                FlutterSwitch(
                  width: 42.0,
                  height: 23.0,
                 padding: 1,
                 // valueFontSize: 18.0,
                  toggleSize: 20.0,
                  value: status,
                  activeColor: AppTheme.PrimaryColor,
                  toggleColor: AppTheme.PrimaryColorBackground,
                  onToggle: (val) {
                  /*  setState(() {
                      status = val;
                    });*/
                    /// TODO provider state
                  },
                ),

              ],
            ),
            SizedBox(height:5),
            Divider(thickness: 1,),
          ],
        ),
      ),
    );
}