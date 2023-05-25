import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobfinder/Controller/data/Network/dio.dart';
import 'package:jobfinder/View/complete_profile/complete_profile.dart';
import 'package:jobfinder/View/profile/General/edit_profile.dart';
import 'package:jobfinder/View/profile/General/language.dart';
import 'package:jobfinder/View/profile/General/login_security.dart';
import 'package:jobfinder/View/profile/General/notification_settings.dart';
import 'package:jobfinder/View/profile/General/portfolio.dart';
import 'package:jobfinder/View/profile/Others/help_center.dart';
import 'package:jobfinder/View/profile/Others/privacy_policy.dart';
import 'package:jobfinder/View/profile/Others/terms_conditions.dart';
import 'package:jobfinder/View/widgets/arrowback_title.dart';
import 'package:jobfinder/View/widgets/bottom_nav_bar.dart';
import 'package:jobfinder/View/widgets/headers.dart';
import 'package:jobfinder/View/widgets/title_container.dart';
import 'package:jobfinder/styles/app_theme.dart';
import 'package:jobfinder/utilities/app_images.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../../Controller/Provider/profile_provider.dart';

import '../../utilities/app_strings.dart';

class profile_page extends StatefulWidget {
  const profile_page({Key? key}) : super(key: key);

  @override
  State<profile_page> createState() => _profile_pageState();
}
var about_controller = TextEditingController();
String?  username;
class _profile_pageState extends State<profile_page> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp)  {
      Provider.of<ProfileProvider>(context,listen: false).showprofile();
      getdata();


      //GetChat();
    });
  }
  Future<void> getdata()
  async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    username =  prefs.getString('name');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        SafeArea(
          child: SingleChildScrollView(
            child: Consumer<ProfileProvider>(
        builder: (context, value, child) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [


                    Stack(
                      children: [

                        Container(
                          height: 220,
                        ),

                        Container(

                          //width: 250,
                          height: 130.sp,
                          color: AppTheme.PrimaryColorBackground,

                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: arrowback_title(title: AppStrings.profile,),
                        ),
                        Positioned(
                            top: 80.sp,
                            right: 100.sp,
                            child: CircleAvatar(maxRadius: 45.sp,
                              backgroundColor: Colors.white,
                              child:
                              CircleAvatar(
                                child: Image.asset("images/profilepic.png"),
                                maxRadius: 40.sp,
                                backgroundColor: Colors.white,
                              ),))
                      ],
                    )

                  ],
                ),

                headers(header1: '${value.profiledata.name.toString()}',
                  header2: value.profiledata.work.toString(),
                  header1size: 16,
                  haeder2size: 12,
                  align2: AlignmentDirectional.center,
                  sizedbox2: 0,),
                TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (
                      context) => complete_profile(),));
                }, child: Text("Complete profile")),
                Padding(

                  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Container(

                    decoration: BoxDecoration(
                        color: AppTheme.titlecontainer,
                        borderRadius: BorderRadiusDirectional.circular(5)
                    ),
                    height: 58.sp,

                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(40, 10, 15, 10),
                        child: Row(

                          children: [

                            text_number(AppStrings.Applied, "46"),
                            SizedBox(width: 10,),
                            VerticalDivider(

                              thickness: 1,

                            ),
                            SizedBox(width: 10,),
                            text_number(AppStrings.Reviewed, "23"),
                            SizedBox(width: 10,),
                            VerticalDivider(

                              thickness: 1,

                            ),
                            SizedBox(width: 10,),
                            text_number(AppStrings.Contacted, "16"),

                          ],

                        ),
                      ),
                    ),

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                  child: Row(
                    children: [
                      Text(
                        AppStrings.About,
                        style: TextStyle(fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: AppTheme.unclickedColor),
                      ),
                      Spacer(),
                      TextButton(onPressed: () {
                        var alert = AlertDialog(
                          title: new Text("About"),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          content: Column(
                            children: <Widget>[
                              new Expanded(
                                child: new TextField(

                                  controller: about_controller,
                                  autofocus: true,
                                  decoration: InputDecoration(
                                    labelText: about_controller.text,
                                    labelStyle:TextStyle(fontSize:20,color: AppTheme.PrimaryColor,),
                                    hintText: "About",
                                    //    icon:  new Icon(Icons.update,color: Colors.deepOrange,),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: AppTheme.PrimaryColor),
                                      borderRadius:BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                          actions: <Widget>[
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(

                                primary: AppTheme.PrimaryColor,
                              ),
                              onPressed: () async {

                                //redrawing scree
                                setState(() {
                                 putabout(about_controller.text);
                                });
                                //updating note



                                Navigator.pop(context);
                              },
                              child: new Text("Edit"),
                            ),
                            new ElevatedButton(
                              style: ElevatedButton.styleFrom(

                                primary: AppTheme.PrimaryColor,
                              ),
                              onPressed: () => Navigator.pop(context),
                              child: new Text("Cancel"),
                            ),
                          ],
                        );
                        showDialog(
                            context: context,
                            builder: (context) {
                              return alert;
                            });
                      }, child: Text(
                          AppStrings.edit)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: Text(
                    value.profiledata.details.toString(),
                    style: TextStyle(color: AppTheme.unclickedColor),),
                ),
                title_container(title: AppStrings.general),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                  child: Column(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => edit_profile(),));
                          },
                          child: general(
                              AppStrings.EditProfile, AppImages.EditProfile)),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => portfolio(),));
                        },
                        child: general(
                            AppStrings.Portfolio, AppImages.Portfolio),),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => language(),));
                        },
                        child: general(
                            AppStrings.Language, AppImages.Langauge),),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => notification_settings(),));
                        },
                        child: general(
                            AppStrings.Notification, AppImages.Notification),),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => login_security(),));
                        },
                        child: general(AppStrings.Loginandsecurity,
                            AppImages.Loginandsecurity),),
                    ],
                  ),
                ),

                title_container(title: AppStrings.others),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                  child: Column(
                    children: [
                      InkWell(child: others(AppStrings.Accesibility),),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => help_center(),));
                        },
                        child:
                        others(AppStrings.HelpCenter),),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => terms_conditions(),));
                        },
                        child: others(AppStrings.TermsandConditions),),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => privacy_policy(),));
                        },
                        child: others(AppStrings.PrivacyPolicy),),
                    ],
                  ),
                ),
              ]
          );
        }),
          ),
        ),
          bottomNavigationBar: bottom_nav_bar(currentIndex: 4),

    );
  }
}
Widget text_number ( String title , String number
)
{
  return  Column(

    children: [

      Text(title,style:TextStyle(fontWeight: FontWeight.bold,color: AppTheme.unclickedColor,fontSize: 13)),
      SizedBox(height: 10,),
      Text(number, style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),

    ],

  );
}
 Widget general( String title , String image)
 {
   return
   Padding(
     padding: const EdgeInsets.fromLTRB(10,10,10,0),
     child: Container
       (
       child:  Column(
         children: [
           Row(
             children: [
               Image.asset(image),
               SizedBox(width:14),
               Text(title,style:TextStyle(fontWeight: FontWeight.w500 ),),
               Spacer(),
               Image.asset(AppImages.arrowforward),

             ],
           ),
           SizedBox(height:5),
           Divider(),
         ],
       ),
     ),
   );
 }
Widget others( String title )
{
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
                Image.asset(AppImages.arrowforward),

              ],
            ),
            SizedBox(height:5),
            Divider(),
          ],
        ),
      ),
    );
}

