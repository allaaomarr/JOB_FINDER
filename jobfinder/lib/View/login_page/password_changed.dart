import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utilities/app_images.dart';
import '../../utilities/app_strings.dart';
import '../widgets/main_button.dart';
import '../widgets/success_widget.dart';

class password_changed extends StatefulWidget {
  const password_changed({Key? key}) : super(key: key);

  @override
  State<password_changed> createState() => _password_changedState();
}

class _password_changedState extends State<password_changed> {
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
              success_widget(header1: AppStrings.PasswordSuccess, header2: AppStrings.PasswordSuccessdetails, image: AppImages.Passwordsuccess),
              Spacer(),
              InkWell(
                onTap: (){},
                child: main_button(label: AppStrings.openemail ,),
              ),
            ],
          ),
        ),

      ),
    );
  }
}
