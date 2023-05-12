import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobfinder/View/widgets/headers.dart';
import 'package:jobfinder/View/widgets/inputfield.dart';
import 'package:jobfinder/View/widgets/logo_arrowback.dart';
import 'package:jobfinder/View/widgets/main_button.dart';
import 'package:jobfinder/View/widgets/other_options.dart';
import 'package:jobfinder/utilities/app_images.dart';
import 'package:jobfinder/utilities/app_strings.dart';

import '../../styles/app_theme.dart';
import 'check_email.dart';
import 'login_page.dart';

class reset_password extends StatelessWidget {
  const reset_password({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
          child: Column(
            children: [
              logo_arrowback(),
              headers(header1: AppStrings.resetpassword, header2: AppStrings.resetpassworddetails),
              inputfield(label: AppStrings.enteryourmail, prefixicon: Image.asset(AppImages.sms)),
              Spacer(),
             other_options(option: AppStrings.yourememberpassword, buttontext: AppStrings.Login,page:login_page()),
              InkWell(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>check_email(),));
                  },
                  child: main_button(label: AppStrings.passwordrequest)),
            ],
          ),
        ),
      ),
    );
  }
}
