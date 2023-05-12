import 'package:country_list_pick/country_list_pick.dart';
import 'package:country_list_pick/country_selection_theme.dart';
import 'package:country_list_pick/support/code_country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:jobfinder/Controller/data/Network/dio.dart';
import 'package:jobfinder/View/register_pages/success_page.dart';
import 'package:jobfinder/View/widgets/save.dart';
import 'package:jobfinder/styles/app_theme.dart';
import 'package:jobfinder/utilities/app_strings.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../Controller/Provider/register_provider.dart';
import '../home_search/home_page.dart';
import '../widgets/headers.dart';
import '../widgets/main_button.dart';

class choose_location extends StatefulWidget {
 String typeofwork;

 choose_location(this.typeofwork,);

  @override
  State<choose_location> createState() => _choose_locationState();
}
String? workfromhome;
String? Remotework;
var activeStep = 0;
final List<bool> _selectedstep= <bool>[true, false,false];
class _choose_locationState extends State<choose_location> {
  List<String> images = [
    "images/us.png",
    "images/mal.png",
    "images/singapore.png",
    "images/indonesia.png",
    "images/philippines.png",
    "images/poland.png",
    "images/india.png",
    "images/vietnam.png",
    "images/china.png",
    "images/canada.png",
    "images/saudi.png",
    "images/argentina.png",
    "images/brazil.png",
  ];

  List<bool> selection = [
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
  ];

  List<String> names = [
    "United States",
    "Malaysia",
    "Singapore",
    "Indonesia",
    "Philippines",
    "Polandia",
    "India",
    "Vietnam",
    "China",
    "Canada",
    "Saudi Arabia",
    "Argentina",
    "Brazil",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(height: 10,),
            headers(
                header1: AppStrings.chooselocation,
                header2: AppStrings.chooselocationdetails),
            ToggleSwitch(
              minWidth: 160.0.sp,
              cornerRadius: 20.0,
              minHeight: 35.sp,
              activeBgColors: [
                [AppTheme.darkblue],
                [AppTheme.darkblue]
              ],
              activeFgColor: Colors.white,
              inactiveBgColor: AppTheme.unclickedbackground,
              inactiveFgColor: AppTheme.unclickedColor,
              initialLabelIndex: activeStep,
              totalSwitches: 2,
              labels: [AppStrings.workfromoffice, AppStrings.remotework],
              radiusStyle: true,
              onToggle: (index) {
                print('switched to: $index');

                activeStep= index!;
    print('switched to: $index');
    setState(() {
    for (int i = 0; i < _selectedstep.length; i++) {
    _selectedstep[i] = i == index;

    }
    });


              },
            ),
            SizedBox(height: 20,),
            Container(
              alignment: AlignmentDirectional.topStart,
                child: Text(AppStrings.selectcountry,style: TextStyle(color: AppTheme.unclickedColor,fontSize: 15),textAlign: TextAlign.start,)),
            _selectedstep[0] ? WorkFromHome() : RemoteWork(),
           Spacer(),
            InkWell(
                onTap: (){
                  Provider.of<RegisterProvider>(
                      context, listen: false).Registerationdatasetup(widget.typeofwork, workfromhome, Remotework);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(
                        builder: (context) => home_page(),));
                },
                child: main_button(label: AppStrings.Next))
     ] ))
    ));
  }
  remotecountryrow(int index1 , int index2){
    return Row(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              selection[index1] = !selection[index1];
             Remotework = names[index1];
              for(int i=0;i<selection.length;i++)
              {
                if(i !=index1) {
                  selection[i] = true;
                }
              }
            });
          },
          child: Container(
            alignment: AlignmentDirectional.topStart,
            height: 35.sp,
            decoration: BoxDecoration(
                color: selection[index1]
                    ? AppTheme.unclickedbackground
                    : AppTheme.PrimaryColorBackground,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  width: 1,
                  color: selection[index1]
                      ? AppTheme.unclickedbuttonColor
                      : AppTheme.PrimaryColor,
                )),
            child: Padding(
              padding: EdgeInsets.fromLTRB(15,7, 10,5),
              child: Row(
                children: [

                  Image.asset(images[index1]),
                  SizedBox(width: 10,),
                  Text(names[index1],style: TextStyle(fontWeight: FontWeight.w400),),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 10,),
        InkWell(
          onTap: () {
            setState(() {
              selection[index2] = !selection[index2];
              Remotework= names[index2];
              for(int i=0;i<selection.length;i++)
              {
                if(i !=index2) {
                  selection[i] = true;
                }
              }

            });
          },
          child: Container(
            alignment: AlignmentDirectional.topStart,
            height: 35.sp,
            decoration: BoxDecoration(
                color: selection[index2]
                    ? AppTheme.unclickedbackground
                    : AppTheme.PrimaryColorBackground,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  width: 1,
                  color: selection[index2]
                      ? AppTheme.unclickedbuttonColor
                      : AppTheme.PrimaryColor,
                )),
            child: Padding(
              padding: EdgeInsets.fromLTRB(15,7, 10,5),
              child: Row(
                children: [
                  Image.asset(images[index2]),
                  SizedBox(width: 10,),
                  Text(names[index2],style: TextStyle(fontWeight: FontWeight.w400),),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  countryrow(int index1 , int index2){
    return Row(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              selection[index1] = !selection[index1];
              workfromhome = names[index1];
              for(int i=0;i<selection.length;i++)
              {
                if(i !=index1) {
                  selection[i] = true;
                }
              }
            });
          },
          child: Container(
            alignment: AlignmentDirectional.topStart,
            height: 35.sp,
            decoration: BoxDecoration(
                color: selection[index1]
                    ? AppTheme.unclickedbackground
                    : AppTheme.PrimaryColorBackground,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  width: 1,
                  color: selection[index1]
                      ? AppTheme.unclickedbuttonColor
                      : AppTheme.PrimaryColor,
                )),
            child: Padding(
              padding: EdgeInsets.fromLTRB(15,7, 10,5),
              child: Row(
                children: [
                  Image.asset(images[index1]),
                  SizedBox(width: 10,),
                  Text(names[index1],style: TextStyle(fontWeight: FontWeight.w400),),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 10,),
        InkWell(
          onTap: () {
            setState(() {
              selection[index2] = !selection[index2];
              workfromhome = names[index2];
              for(int i=0;i<selection.length;i++)
              {
                if(i !=index2) {
                  selection[i] = true;
                }
              }

            });
          },
          child: Container(
            alignment: AlignmentDirectional.topStart,
            height: 35.sp,
            decoration: BoxDecoration(
                color: selection[index2]
                    ? AppTheme.unclickedbackground
                    : AppTheme.PrimaryColorBackground,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  width: 1,
                  color: selection[index2]
                      ? AppTheme.unclickedbuttonColor
                      : AppTheme.PrimaryColor,
                )),
            child: Padding(
              padding: EdgeInsets.fromLTRB(15,7, 10,5),
              child: Row(
                children: [
                  Image.asset(images[index2]),
                  SizedBox(width: 10,),
                  Text(names[index2],style: TextStyle(fontWeight: FontWeight.w400),),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
  RemoteWork(){
    return
        Column(
          children: [
            SizedBox(
              height: 20,
            ),

            SizedBox(width: 10,),
            remotecountryrow(0, 1),
            SizedBox(height: 10,),
            remotecountryrow(2, 3),
            SizedBox(height: 10,),
            remotecountryrow(4, 5),
            SizedBox(height: 10,),
            Row(
              children: [
                remotecountryrow(6, 7),
                SizedBox(width: 10,),
                InkWell(
                  onTap: () {
                    setState(() {
                      selection[8] = !selection[8];
                      workfromhome = names[8];
                      for(int i=0;i<selection.length;i++)
                      {
                        if(i !=8) {
                          selection[i] = true;
                        }
                      }

                    });
                  },
                  child: Container(
                    alignment: AlignmentDirectional.topStart,
                    height: 35.sp,
                    decoration: BoxDecoration(
                        color: selection[8]
                            ? AppTheme.unclickedbackground
                            : AppTheme.PrimaryColorBackground,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          width: 1,
                          color: selection[8]
                              ? AppTheme.unclickedbuttonColor
                              : AppTheme.PrimaryColor,
                        )),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(15,7, 10,5),
                      child: Row(
                        children: [
                          Image.asset(images[8]),
                          SizedBox(width: 10,),
                          Text(names[8],style: TextStyle(fontWeight: FontWeight.w400),),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            remotecountryrow(9, 10),
            SizedBox(height: 10,),
            remotecountryrow(11, 12),
          ],
        );
  }
  WorkFromHome(){
    return Column(
      children: [  SizedBox(
        height: 20,
      ),

        SizedBox(width: 10,),
        countryrow(0, 1),
        SizedBox(height: 10,),
        countryrow(2, 3),
        SizedBox(height: 10,),
        countryrow(4, 5),
        SizedBox(height: 10,),
        Row(
          children: [
            countryrow(6, 7),
            SizedBox(width: 10,),
            InkWell(
              onTap: () {
                setState(() {
                  selection[8] = !selection[8];
                  workfromhome = names[8];
                  for(int i=0;i<selection.length;i++)
                  {
                    if(i !=8) {
                      selection[i] = true;
                    }
                  }

                });
              },
              child: Container(
                alignment: AlignmentDirectional.topStart,
                height: 35.sp,
                decoration: BoxDecoration(
                    color: selection[8]
                        ? AppTheme.unclickedbackground
                        : AppTheme.PrimaryColorBackground,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      width: 1,
                      color: selection[8]
                          ? AppTheme.unclickedbuttonColor
                          : AppTheme.PrimaryColor,
                    )),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15,7, 10,5),
                  child: Row(
                    children: [
                      Image.asset(images[8]),
                      SizedBox(width: 10,),
                      Text(names[8],style: TextStyle(fontWeight: FontWeight.w400),),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10,),
        countryrow(9, 10),
        SizedBox(height: 10,),
        countryrow(11, 12),],
    );
  }
}
