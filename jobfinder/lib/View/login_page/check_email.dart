import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobfinder/View/login_page/create_password.dart';

import '../../utilities/app_images.dart';
import '../../utilities/app_strings.dart';
import '../widgets/main_button.dart';
import '../widgets/success_widget.dart';

class check_email extends StatefulWidget {
  const check_email({Key? key}) : super(key: key);

  @override
  State<check_email> createState() => _check_emailState();
}

class _check_emailState extends State<check_email> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(

        child: Padding(
          padding: const EdgeInsets.all(17),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(children: [
              //  IconButton( icon:Icon(Icons.arrow_back),onPressed: (){Navigator.pop(context);},),
              ],),
              Spacer(),
              success_widget(header1: AppStrings.checkyourmail, header2: AppStrings.checkyourmaildetails, image: AppImages.Emailsuccess),
              Spacer(),
              InkWell(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>create_password(),));
                },
                child: main_button(label: AppStrings.openemail ,),
              ),
            ],
          ),
        ),

      ),
    );
  }
}
