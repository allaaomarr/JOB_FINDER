import 'package:easy_stepper/easy_stepper.dart';
import 'package:jobfinder/View/widgets/main_button.dart';

import '../../../../utilities/app_images.dart';
import '../../../../utilities/app_strings.dart';

import '../../../widgets/arrowback_title.dart';
import '../../../widgets/inputField.dart';


class email_address extends StatefulWidget {
  const email_address({Key? key}) : super(key: key);

  @override
  State<email_address> createState() => _email_addressState();
}

class _email_addressState extends State<email_address> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              arrowback_title(title:AppStrings.Emailaddress),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Container(
                      alignment :AlignmentDirectional.topStart,
                      child: Text(AppStrings.Mainemailaddress,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),textAlign: TextAlign.start,)),
                  SizedBox(height: 10,),
                  inputfield(label: AppStrings.Email,prefixicon: Image.asset(AppImages.sms),),
                  SizedBox(height: 460,),
                  main_button(label: AppStrings.Save),

                ],
              ),
            ),
          ),

            ],
          ),
        ),
      ),
    );;
  }
}
