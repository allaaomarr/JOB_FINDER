import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobfinder/View/login_page/password_changed.dart';

import '../../styles/app_theme.dart';
import '../../utilities/app_images.dart';
import '../../utilities/app_strings.dart';
import '../widgets/headers.dart';
import '../widgets/inputfield.dart';
import '../widgets/logo_arrowback.dart';
import '../widgets/main_button.dart';
import '../widgets/other_options.dart';
import 'check_email.dart';
import 'login_page.dart';

class create_password extends StatelessWidget {
  const create_password({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
          child: Column(
            children: [
              logo_arrowback(),
              headers(header1: AppStrings.createpassword, header2: AppStrings.createpassworddetails),
              inputfield(label: AppStrings.Password, prefixicon: Image.asset(AppImages.lock),isPasswordField: true,isObscureText: true,),
              SizedBox(height: 10,),
             Container(
               alignment: AlignmentDirectional.topStart,
                 child: Text(AppStrings.passwordletters,style: TextStyle(color: AppTheme.lightunclickedColor),textAlign: TextAlign.start,)),
              SizedBox(height: 20,),
              inputfield(label: AppStrings.ConfirmPassword, prefixicon: Image.asset(AppImages.lock),isObscureText: true,isPasswordField: true,),
              SizedBox(height: 10,),
                 Container(
                   alignment: AlignmentDirectional.topStart,
                     child: Text(AppStrings.passwordmatch,style: TextStyle(color: AppTheme.lightunclickedColor),textAlign: TextAlign.left,)),
              Spacer(),

              InkWell(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>password_changed(),));
                  },
                  child: main_button(label: AppStrings.resetpassword)),
            ],
          ),
        ),
      ),
    );
  }
}
