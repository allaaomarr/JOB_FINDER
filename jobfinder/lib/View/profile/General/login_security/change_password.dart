import 'package:easy_stepper/easy_stepper.dart';
import 'package:jobfinder/View/widgets/main_button.dart';
import 'package:jobfinder/utilities/app_images.dart';

import '../../../../utilities/app_strings.dart';

import '../../../widgets/arrowback_title.dart';
import '../../../widgets/inputField.dart';


class change_password extends StatefulWidget {
  const change_password({Key? key}) : super(key: key);

  @override
  State<change_password> createState() => _change_passwordState();
}

class _change_passwordState extends State<change_password> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              arrowback_title(title:AppStrings.changepassword),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    fieldpassword(AppStrings.Enteryouroldpassword),
                    fieldpassword(AppStrings.Enteryournewpassword),
                    fieldpassword(AppStrings.Confirmyournewpassword),
                    SizedBox(height: 250,),
                    main_button(label: AppStrings.Save),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget fieldpassword(String title){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Container(
            alignment :AlignmentDirectional.topStart,
            child: Text(title,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),textAlign: TextAlign.start,)),
        SizedBox(height: 10,),
        inputfield(label: title,isObscureText: true,isPasswordField: true,prefixicon: Image.asset(AppImages.lock),),
        SizedBox(height: 5,),
      ],
    ),
  );
}