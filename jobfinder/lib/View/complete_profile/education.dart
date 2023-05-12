import 'package:jobfinder/Controller/Provider/complete_profile_provider.dart';
import 'package:jobfinder/Controller/data/Network/dio.dart';
import 'package:jobfinder/View/widgets/experience_container.dart';
import 'package:jobfinder/View/widgets/inputfield.dart';
import 'package:jobfinder/View/widgets/main_button.dart';

import 'package:jobfinder/utilities/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../styles/app_theme.dart';
import '../../utilities/app_images.dart';
import '../widgets/arrowback_title.dart';
class education extends StatefulWidget {
  const education ({Key? key}) : super(key: key);

  @override
  State<education > createState() => _educationState();
}
TextEditingController uni_controller =TextEditingController();
TextEditingController title_controller =TextEditingController();
TextEditingController start_date_controller =TextEditingController();
TextEditingController end_date_controller =TextEditingController();

class _educationState extends State<education> {
  final GlobalKey<FormState> eduKey = GlobalKey<FormState>();
 @override
void initState() {
   super.initState();
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    Provider.of<CompleteProfileProvider>(context,listen: false).getalleducation();
    /// NOT working fix it
   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
       child: SingleChildScrollView(
          child:

     Consumer<CompleteProfileProvider>(
    builder: (context, value, child) {
        return
          // child :
          Form(
            key: eduKey,
            child: Column(
              children: [
                arrowback_title(title: AppStrings.Education),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child:

                  Column(
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
                                Text(AppStrings.University, style: TextStyle(
                                    color: AppTheme.unclickedColor),),
                                SizedBox(height: 10,),
                                inputfield(label: AppStrings.University,
                                  controller: uni_controller,),
                                SizedBox(height: 10,),
                                Text(AppStrings.Title, style: TextStyle(
                                    color: AppTheme.unclickedColor),),
                                SizedBox(height: 10,),
                                inputfield(label: AppStrings.Title,
                                  controller: title_controller,),
                                SizedBox(height: 10,),
                                Text(AppStrings.StartYear, style: TextStyle(
                                    color: AppTheme.unclickedColor),),
                                SizedBox(height: 10,),
                                inputfield(label: AppStrings.StartYear,
                                  iconButton: IconButton(onPressed: () {},
                                      icon: Image.asset(AppImages.calender,
                                        color: Colors.black,)),
                                  controller: start_date_controller,),

                                SizedBox(height: 10,),
                                Text(AppStrings.EndYear, style: TextStyle(
                                    color: AppTheme.unclickedColor),),
                                SizedBox(height: 10,),
                                inputfield(label: AppStrings.EndYear,
                                  iconButton: IconButton(onPressed: () {},
                                      icon: Image.asset(AppImages.calender,
                                        color: Colors.black,)),
                                  controller: end_date_controller,),
                                SizedBox(height: 50,),
                                InkWell(
                                    onTap: () {
                                      Provider.of<CompleteProfileProvider>(context,listen: false).getalleducation();
                                   Provider.of<CompleteProfileProvider>(context,listen: false).Posteducation(uni_controller.text,
                                        title_controller.text,
                                        start_date_controller.text,
                                         end_date_controller.text);
                                   Provider.of<CompleteProfileProvider>(context,listen: false).getalleducation();
                                   context.read<CompleteProfileProvider>().savededucation;
                                    },
                                    child: main_button(label: AppStrings.Save)),
                                SizedBox(height: 10,),
                              ],
                            ),
                          ),),

                      SizedBox(height: 40,),


                      value.savededucation.length > 0 ?
                  experience_container(title: value.savededucation[0].title.toString(),
                        details: value.savededucation[0].university.toString(),end_date: value.savededucation[0].end_date.toString(),start_date: value.savededucation[0].start_date.toString(),) : Text("")




                    ],
                  ),
                ),
              ],
            ),
          );
       }
        ),
      ),
      ),
    );
  }
}