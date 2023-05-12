import 'package:easy_stepper/easy_stepper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:jobfinder/Controller/Provider/firebase_provider.dart';
import 'package:jobfinder/Controller/data/Network/dio.dart';
import 'package:jobfinder/View/widgets/arrowback_title.dart';
import 'package:jobfinder/View/widgets/inputfield.dart';
import 'package:jobfinder/View/widgets/main_button.dart';
import 'package:jobfinder/styles/app_theme.dart';
import 'package:jobfinder/utilities/app_images.dart';
import 'package:jobfinder/utilities/app_strings.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class edit_profile extends StatefulWidget {
  const edit_profile({Key? key}) : super(key: key);

  @override
  State<edit_profile> createState() => _edit_profileState();
}
var name_controller = TextEditingController();
var bio_controller = TextEditingController();
var address_controller = TextEditingController();
var mobile_controller = TextEditingController();
final GlobalKey<FormState> editKey = GlobalKey<FormState>();
class _edit_profileState extends State<edit_profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: SingleChildScrollView(
            child: Form(
              key: editKey,
              child: Column(
                children: [
                  arrowback_title(title:AppStrings.EditProfile),
                  Column(
                    children: [
                      CircleAvatar(maxRadius: 40.sp,
                        backgroundColor: AppTheme.titlecontainer,
                        child:
                        CircleAvatar(
                          child:  Image.asset(AppImages.camera),
                          maxRadius: 30.sp,
                          backgroundColor: AppTheme.titlecontainer,
                        ),),
TextButton(onPressed: (){
  Provider.of<FirebaseProvider>(context,listen: false).imagePicker;
}, child: Text(AppStrings.Changephoto,style: TextStyle(color: AppTheme.PrimaryColor,fontSize: 16),)),
field(AppStrings.name,name_controller),
                      field(AppStrings.bio,bio_controller),
                      field(AppStrings.Address,address_controller),
                      Padding(
                        padding: const EdgeInsets.all(8.0),

                        child: Column(
                          children: [
                            Container(
                                alignment :AlignmentDirectional.topStart,
                                child: Text(AppStrings.phonenumber,style: TextStyle(color: AppTheme.unclickedColor),textAlign: TextAlign.start,)),
                            SizedBox(height: 10,),
                            IntlPhoneField(
                               controller: mobile_controller,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                labelText: AppStrings.phonenumber,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(),
                                    borderRadius: BorderRadius.circular(7),


                                ),

                              ),

                              initialCountryCode: 'IN',
                              onChanged: (phone) {
                                print(phone.completeNumber);
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 50,),
                      InkWell(
                        onTap: (){
                          puteditprofile(bio_controller.text, address_controller.text, mobile_controller.text);
                        },
                          child: main_button(label: AppStrings.Save)),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget field(String title, TextEditingController controller){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Container(
            alignment :AlignmentDirectional.topStart,
      child: Text(title,style: TextStyle(color: AppTheme.unclickedColor),textAlign: TextAlign.start,)),
        SizedBox(height: 10,),
        inputfield(label: title,controller:controller ,),

      ],
    ),
  );
}