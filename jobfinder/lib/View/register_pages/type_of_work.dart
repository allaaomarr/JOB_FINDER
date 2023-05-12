import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobfinder/View/register_pages/_choose_location.dart';
import 'package:jobfinder/View/widgets/headers.dart';
import 'package:jobfinder/View/widgets/main_button.dart';
import 'package:jobfinder/utilities/app_strings.dart';
import 'package:sizer/sizer.dart';

import '../../styles/app_theme.dart';

class type_of_work extends StatefulWidget {

  @override
  State<type_of_work> createState() => _type_of_workState();
}

class _type_of_workState extends State<type_of_work> {
  bool selected = false;
  String? typeofwork;
  List<bool> selection = [
    true,
    true,
   true,
  true,
    true,
    true,
  ];
  List<String> titles = [
   "UI/UX Designer",
    "Ilustrator Designer",
   "Developer",
    "Management",
   "Information Technology",
    "Research and Analytics",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(17),
        child: Column(
          children: [
            headers(
                header1: AppStrings.typeofwork,
                header2: AppStrings.typeofworkdetails),
            Expanded(
              child: GridView.builder(
                  itemCount: titles.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.1,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                         // selected = !selected;
                          selection[index] = !selection[index];
                          for(int i=0;i<selection.length;i++)
                          {
                            if(i !=index) {
                              selection[i] = true;
                            }
                          }
                          typeofwork = titles[index];
                          print(typeofwork);

                        });
                      },
                      child: Container(
                        alignment: AlignmentDirectional.topStart,
                        height: 115.sp,
                        width: 156.sp,
                        decoration: BoxDecoration(
                            color: selection[index]
                                ? AppTheme.unclickedbackground
                                : AppTheme.PrimaryColorBackground,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 1.5,
                              color: selection[index]
                                  ? AppTheme.unclickedbuttonColor
                                  : AppTheme.PrimaryColor,
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 15, 16, 10),
                                child: Container(

                                  height: 50.sp,
                                  width: 50.sp,
                                  decoration: BoxDecoration(
                                      color: selection[index]
                                          ? AppTheme.unclickedbackground
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                        width: 1.5,
                                        color: selection[index]
                                            ? AppTheme.unclickedbuttonColor
                                            : AppTheme.PrimaryColor,
                                      )),
                                  child: selection[index]
                                      ? Image.asset(
                                          "images/code.png",
                                        )
                                      : Image.asset(
                                          "images/code.png",
                                          color: AppTheme.PrimaryColor,
                                        ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                child: Text(
                                  titles[index],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15.sp),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => choose_location(
                            typeofwork!
                        ),
                      ));
                },
                child: main_button(label: AppStrings.Next)),
          ],
        ),
      ),
    ));
  }
}
