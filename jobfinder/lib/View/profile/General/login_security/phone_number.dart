import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:jobfinder/styles/app_theme.dart';

import '../../../../utilities/app_strings.dart';
import '../../../widgets/arrowback_title.dart';
import '../../../widgets/main_button.dart';


class phone_number extends StatefulWidget {
  const phone_number({Key? key}) : super(key: key);

  @override
  State<phone_number> createState() => _phone_numberState();
}
bool status = true;
class _phone_numberState extends State<phone_number> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
              children: [
                arrowback_title(title:AppStrings.Phonenumber),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Container(
                          alignment :AlignmentDirectional.topStart,
                          child: Text(AppStrings.Mainphonenumber,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),textAlign: TextAlign.start,)),
                      SizedBox(height: 10,),
                      IntlPhoneField(

                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          labelText: AppStrings.phonenumber,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius: BorderRadius.circular(7),


                          ),

                        ),

                        initialCountryCode: 'US',
                        onChanged: (phone) {
                          print(phone.completeNumber);
                        },
                      ),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Text(AppStrings.Usethephonenumbertoresetyourpassword,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,color: AppTheme.unclickedColor),textAlign: TextAlign.start,),
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
                              setState(() {
                                status = val;
                              });
                              /// TODO provider state
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 440,),
                      main_button(label: AppStrings.Save),



                    ],
                  ),
                ),
           ]

            ),
          ),
        ),
      );

  }
}
