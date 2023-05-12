import 'package:easy_stepper/easy_stepper.dart';
import 'package:jobfinder/View/widgets/headers.dart';
import 'package:jobfinder/View/widgets/success_widget.dart';
import 'package:jobfinder/View/widgets/title_container.dart';
import 'package:jobfinder/styles/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utilities/app_images.dart';
import '../../utilities/app_strings.dart';
import '../widgets/arrowback_title.dart';

class notification extends StatefulWidget {
  const notification({Key? key}) : super(key: key);

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea
        (
        child: Column(
          children: [
            arrowback_title(title: AppStrings.notification),
            title_container(title: AppStrings.New),
            Flexible(
             // flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset("images/facebookbig.png",),
                          SizedBox(width: 15,),

                            headers(header1: AppStrings.Facebook, header2: "Posted new design jobs",header1size: 13,haeder2size: 11,align: CrossAxisAlignment.start,sizedbox: 5,sizedbox2: 0,),
                            Spacer(),
                            Icon(Icons.circle,color: Colors.orangeAccent,size: 10,),
                            SizedBox(width: 5,),

                                  Text("10.00AM",style: TextStyle(color: AppTheme.unclickedColor),textAlign: TextAlign.left,),


                          ],
                        ),
                        SizedBox(height: 10,),
                        Divider(thickness: 1,),
                      ],

                    ),
                  );
                },),
              ),
            ),
            title_container(title: AppStrings.yesterday),
          ],
        ),
      ),
    );
  }
}
Widget no_notification(){
  return success_widget(header1: AppStrings.nonotification, header2:AppStrings.nonotificationdetails, image: AppImages.nonotification);
}