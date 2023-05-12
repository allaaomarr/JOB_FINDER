import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobfinder/View/widgets/arrowback_title.dart';
import 'package:jobfinder/utilities/app_images.dart';

import 'package:jobfinder/utilities/app_strings.dart';
import 'package:provider/provider.dart';

import '../../Controller/Provider/complete_profile_provider.dart';
import '../../styles/app_theme.dart';
import '../widgets/experience_container.dart';
import '../widgets/inputField.dart';
import '../widgets/main_button.dart';

class experience extends StatefulWidget {
  const experience({Key? key}) : super(key: key);

  @override
  State<experience> createState() => _experienceState();
}

TextEditingController position_controller =TextEditingController();
TextEditingController typework_controller =TextEditingController();
TextEditingController compname_controller =TextEditingController();
TextEditingController location_controller =TextEditingController();
TextEditingController start_controller =TextEditingController();
bool isChecked = false;
class _experienceState extends State<experience> {
  final GlobalKey<FormState> expKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<CompleteProfileProvider>(context,listen: false).getallexperience();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              arrowback_title(title:AppStrings.Experience ),
              Padding(
                padding: const EdgeInsets.all(15),
                child:    Consumer<CompleteProfileProvider>(
    builder: (context, value, child) {
      return Form(
        key: expKey,
        child: Column(
          children: [

            Container(

              decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    width: 1.5,
                    color: AppTheme.unclickedbuttonColor,
                  )


              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Text(AppStrings.Position,
                      style: TextStyle(color: AppTheme.unclickedColor),),
                    SizedBox(height: 10,),
                    inputfield(label: AppStrings.Position,
                      controller: position_controller,),
                    SizedBox(height: 10,),
                    Text(AppStrings.Typeofwork,
                      style: TextStyle(color: AppTheme.unclickedColor),),
                    SizedBox(height: 10,),
                    inputfield(label: AppStrings.Typeofwork,
                      controller: typework_controller,),
                    SizedBox(height: 10,),
                    Text(AppStrings.Companyname,
                      style: TextStyle(color: AppTheme.unclickedColor),),
                    SizedBox(height: 10,),
                    inputfield(label: AppStrings.Companyname,
                      controller: compname_controller,),

                    SizedBox(height: 10,),
                    Text(AppStrings.Location,
                      style: TextStyle(color: AppTheme.unclickedColor),),
                    SizedBox(height: 10,),
                    inputfield(label: AppStrings.Location,
                      prefixicon: Image.asset(AppImages.marker),
                      controller: location_controller,),
                    Row(
                      children: [
                        Checkbox(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          checkColor: Colors.white,
                          activeColor: AppTheme.PrimaryColor,
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },),
                        Text(AppStrings.currentlyworking,
                          style: TextStyle(fontWeight: FontWeight.w500),),
                      ],
                    ),
                    SizedBox(height: 10,),

                    Text(AppStrings.StartYear,
                      style: TextStyle(color: AppTheme.unclickedColor),),
                    SizedBox(height: 10,),
                    inputfield(label: AppStrings.StartYear,
                      controller: start_controller,),
                    SizedBox(height: 50,),

                    InkWell(
                        onTap: () {
                          Provider.of<CompleteProfileProvider>(
                              context, listen: false).Postexperience(
                              position_controller.text,
                              typework_controller.text,
                              compname_controller.text,
                              location_controller.text, start_controller.text);
                          Provider.of<CompleteProfileProvider>(
                              context, listen: true).getallexperience();
                          Provider
                              .of<CompleteProfileProvider>(
                              context, listen: true)
                              .savededucation;
                        },
                        child: main_button(label: AppStrings.Save)),
                    SizedBox(height: 10,),
                  ],
                ),
              ),),
            SizedBox(height: 30,),
            Provider.of<CompleteProfileProvider>(context,listen: false).savedexperience.length > 0 ? experience_container(title: value.savedexperience[0].postion.toString(),details: value.savedexperience[0].type_work.toString() +"."+value.savedexperience[0].comp_name.toString() , start_date: value.savedexperience[0].start.toString(), end_date: '55',):Text("")
          ],
        ),
      );

    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}