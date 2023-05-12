
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:jobfinder/View/apply_job/apply_success.dart';
import 'package:jobfinder/View/widgets/cv_container.dart';
import 'package:jobfinder/View/widgets/headers.dart';
import 'package:jobfinder/View/widgets/main_button.dart';
import 'package:jobfinder/View/widgets/upload_file_widget.dart';
import '../widgets/arrowback_title.dart';
import '../widgets/inputfield.dart';
import '../../styles/app_theme.dart';
import '../../utilities/app_images.dart';
import '../../utilities/app_strings.dart';
class apply_job extends StatefulWidget {
  const apply_job({Key? key}) : super(key: key);

  @override
  State<apply_job> createState() => _apply_jobState();
}
int activeStep = 0;
String? selectedValue;
final List<bool> _selectedstep= <bool>[true, false, false];
List <bool> choose =[
  true,
  true,
  true,
  true,
];
/// TODO next step using next button
class _apply_jobState extends State<apply_job> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                arrowback_title(title: AppStrings.applyjob),
                EasyStepper(
                  activeStep: activeStep,

                  lineLength: 70,
                  steppingEnabled: true,
                  padding: 10,
                  stepRadius: 24,
                  finishedStepBorderColor: AppTheme.PrimaryColor,
                  finishedStepTextColor: AppTheme.PrimaryColor,
                  finishedStepBackgroundColor:AppTheme.PrimaryColor,
                  activeStepIconColor:Colors.white,
                  activeStepBackgroundColor: AppTheme.PrimaryColor,
                  activeStepTextColor:AppTheme.PrimaryColor ,

                  steps: const [
                    EasyStep(
                      icon: Icon(CupertinoIcons.number),
                      title: AppStrings.biodata,
                      activeIcon: Icon(CupertinoIcons.check_mark),
finishIcon: Icon(CupertinoIcons.check_mark),

                    ),
                    EasyStep(
                      icon: Icon(Icons.category_rounded),
                      title: AppStrings.worktype,
                      activeIcon: Icon(CupertinoIcons.check_mark),
                      finishIcon: Icon(CupertinoIcons.check_mark),
                    ),
                    EasyStep(
                      icon: Icon(Icons.local_shipping_rounded),
                      title: AppStrings.uploadportoflio,
                      activeIcon: Icon(CupertinoIcons.check_mark),
                      finishIcon: Icon(CupertinoIcons.check_mark),
                    ),

                  ],
                  onStepReached: (index) {
                    activeStep = index;
                    setState(() { for (int i = 0; i < _selectedstep.length; i++) {
                      _selectedstep[i] = i == index;}

                    });},
                ),
                _selectedstep[0] ? step1() : _selectedstep[1] ? step2(): step3(),


InkWell(
  onTap: (){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => apply_success()) );

  },
    child: main_button(label: AppStrings.Next)),
/// todo make button next and change to submit
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget step2(){
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          headers(header1: AppStrings.worktype, header2: AppStrings.fillin,header1size: 17,haeder2size:12,sizedbox: 5,),

          ListView.builder(
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (context, index) {
              return
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(

                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 1.5,
                          color:  AppTheme.unclickedbuttonColor,
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(

                        children: [
                          headers(header1: "Senior UX Designer", header2: "CV.pdf . Portfolio.pdf",sizedbox: 5,align: CrossAxisAlignment.start,align2: AlignmentDirectional.topStart,header1size: 13,haeder2size: 11,sizedbox2: 0,),

                          IconButton(onPressed: (){

                            setState(() { choose[index]=!choose[index];

                              ///provider

                            });

                          },



                            icon: Image.asset(

                              choose[index]  ?

                              AppImages.circle:AppImages.checkcircle,

                            ),

                          )
                          /*    Container(
                              //  height: 70,
                              //  width: 50,
  child:   IconButton(onPressed: (){



  }, icon: Icon(Icons.radio_button_off)),
)*/
                          ///TODO radio button
                          /// TODO selected color
                        ],
                      ),
                    ),
                  ),
                );

            },

          ),



        ],
      ),
    );
  }
  Widget step1(){
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [

          headers(header1: AppStrings.biodata, header2: AppStrings.fillin,header1size: 17,haeder2size:12,sizedbox: 5,),

          Container(
              alignment: AlignmentDirectional.topStart,
              child: Row(
                children: [
                  Text(AppStrings.fullname ,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),textAlign: TextAlign.start,),
                  Text("*",style: TextStyle(fontSize: 15,color: Colors.red),textAlign: TextAlign.start,),
                ],
              )),
          SizedBox(height: 10,) ,
          inputfield(label: AppStrings.fullname, prefixicon: Image.asset(AppImages.profile)),
          SizedBox(height: 20,) ,
          Container(
              alignment: AlignmentDirectional.topStart,
              child: Row(
                children: [
                  Text(AppStrings.Email ,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),textAlign: TextAlign.start,),
                  Text("*",style: TextStyle(fontSize: 15,color: Colors.red),textAlign: TextAlign.start,),
                ],
              )),
          SizedBox(height: 10,) ,
          inputfield(label: AppStrings.Email , prefixicon:Image.asset(AppImages.sms) ),
          SizedBox(height: 20,) ,
          Container(
              alignment: AlignmentDirectional.topStart,
              child: Row(
                children: [
                  Text(AppStrings.phonenumber ,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),textAlign: TextAlign.start,),
                  Text("*",style: TextStyle(fontSize: 15,color: Colors.red),textAlign: TextAlign.start,),
                ],
              )),
          SizedBox(height: 10,) ,
          IntlPhoneField(

            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              labelText: AppStrings.phonenumber,
              border: OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.circular(10)
              ),
            ),
            initialCountryCode: 'IN',
            onChanged: (phone) {
              print(phone.completeNumber);
            },
          ),
          SizedBox(height: 80,),
        ],
      ),
    );
  }

  Widget step3(){
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          headers(header1: AppStrings.uploadportoflio, header2: AppStrings.fillin,header1size: 17,haeder2size:12,sizedbox: 5,),
          Container(
              alignment: AlignmentDirectional.topStart,
              child: Row(
                children: [
                  Text(AppStrings.uploadcv ,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),textAlign: TextAlign.start,),
                  Text("*",style: TextStyle(fontSize: 15,color: Colors.red),textAlign: TextAlign.start,),
                ],
              )),
          SizedBox(height: 15,),
          cv_container(filename: "Rafif Dian.CV"),
          SizedBox(height: 15,),
          Container(
              alignment: AlignmentDirectional.topStart,
              child: Text(AppStrings.otherfile ,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),textAlign: TextAlign.start,)),
          SizedBox(height: 15,),
          upload_file_widget(),
          SizedBox(height: 20,)
        ],
      ),
    );
  }

}

