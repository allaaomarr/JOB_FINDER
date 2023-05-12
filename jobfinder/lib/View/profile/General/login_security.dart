import 'package:easy_stepper/easy_stepper.dart';
import 'package:jobfinder/View/profile/General/login_security/phone_number.dart';

import 'package:jobfinder/View/widgets/arrowback_title.dart';
import 'package:jobfinder/View/widgets/title_container.dart';
import 'package:jobfinder/styles/app_theme.dart';
import 'package:jobfinder/utilities/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../utilities/app_images.dart';
import 'login_security/change_password.dart';
import 'login_security/email_address.dart';
import 'login_security/two_step_verfication.dart';

class login_security extends StatefulWidget {
  const login_security({Key? key}) : super(key: key);

  @override
  State<login_security> createState() => _login_securityState();
}

class _login_securityState extends State<login_security> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            arrowback_title(title:AppStrings.Loginandsecurity),
            title_container(title: AppStrings.Accountaccess),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  InkWell(
                  onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) =>email_address(),));
            },
              child:    settings(AppStrings.Emailaddress,'rafifdian12@gmail.com'),
                  ),
        InkWell(
          onTap: (){
        //   Navigator.push(context, MaterialPageRoute(builder: (context) => phone_number(),));
          },
          child:    settings(AppStrings.Phonenumber),),
    InkWell(
    onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context) =>change_password(),));
    },
    child:      settings(AppStrings.changepassword),),
      InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) =>two_step_verfication(),));
        },
        child:      settings(AppStrings.Twostepverification,'Non active'),),
    InkWell(
    onTap: (){
 //   Navigator.push(context, MaterialPageRoute(builder: (context) =>login_security(),));
    },
    child:     settings(AppStrings.FaceID),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
settings (String title, [String value= ""]){
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
                Text(value,style:TextStyle(fontWeight: FontWeight.w500,color: AppTheme.unclickedColor,fontSize: 13 ),),
                SizedBox(width:10),
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