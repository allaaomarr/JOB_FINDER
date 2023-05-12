import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:jobfinder/View/widgets/main_button.dart';
import 'package:jobfinder/View/widgets/success_widget.dart';
import 'package:jobfinder/View/widgets/title_container.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../Controller/Provider/search_provider.dart';
import '../../styles/app_theme.dart';
import '../../utilities/app_images.dart';
import '../../utilities/app_strings.dart';
import '../widgets/headers.dart';
import '../widgets/inputfield.dart';
import '../widgets/save.dart';
import 'home_page.dart';

class search_page extends StatefulWidget {
search_page({Key? key}) : super(key: key);

  @override
  State<search_page> createState() => _search_pageState();
}

class _search_pageState extends State<search_page> {
  var search_value_controller = TextEditingController();
  var title_value_controller = TextEditingController();
  var location_value_controller = TextEditingController();
  var salary_value_controller = TextEditingController();
List<bool> selection = [
  true,
  true,
  true,
  true,
  true,
  true,

];

  List<String> names = [
    "Full Time",
    "Remote",
    "Contract",
    "Part Time",
    "Onsite",
    "Internship"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
       child: Consumer<SearchProvider>(
        builder: (context, value, child) {
          /* if (value.isLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } */ return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                        //  Navigator.pop(context);
                          showMaterialModalBottomSheet(
                            context: context,
                            builder: (context) => Container(
                           height:580.sp ,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                            IconButton(  icon: ImageIcon(
                                    AssetImage(AppImages.arrowback),
                            ), onPressed: () {  },),
                                        Spacer(),
                                        Text(AppStrings.setfilter,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17)),
                                        Spacer(),
                                        TextButton( onPressed: () {  }, child: Text(AppStrings.reset,style: TextStyle(fontWeight: FontWeight.w500,color: AppTheme.PrimaryColor)),),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Container(
                                          alignment: Alignment.topLeft,
                                          child: Text(AppStrings.jobtitle,style: TextStyle(fontWeight: FontWeight.w500,)),),
                                    ),


                                    inputfield(label: AppStrings.jobtitle,prefixicon: Image.asset(AppImages.applied,color: Colors.black,),controller: title_value_controller,),
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Container(
                                        alignment: Alignment.topLeft,
                                        child: Text(AppStrings.Location,style: TextStyle(fontWeight: FontWeight.w500,)),),
                                    ),
                                    inputfield(label: AppStrings.Location,prefixicon: Image.asset(AppImages.marker,color: Colors.black,),controller: location_value_controller,),
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Container(
                                        alignment: Alignment.topLeft,
                                        child: Text(AppStrings.Salary,style: TextStyle(fontWeight: FontWeight.w500,)),),
                                    ),
                                    inputfield(label: AppStrings.Salary,prefixicon: Image.asset(AppImages.dollar,color: Colors.black,),controller: salary_value_controller,),
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Container(
                                        alignment: Alignment.topLeft,
                                        child: Text(AppStrings.jobtype,style: TextStyle(fontWeight: FontWeight.w500,)),),
                                    ),
                                    jobtype(0, 1, 2),
                                    SizedBox(height: 10,),
                                    jobtype(3, 4, 5),
                                    Spacer(),
                                    InkWell(
                                      onTap:(){
                                        Provider.of<SearchProvider>(context, listen: false).filtersearchapi(title_value_controller.text, location_value_controller.text, salary_value_controller.text);
                                       // Navigator.pop(context);

                                      },
                                        child: main_button(label: AppStrings.showresult))
                                  ],
                                ),
                              ),
                          ),
                              shape:RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20))),
                          );

                        },
                        icon: ImageIcon(
                          AssetImage(AppImages.arrowback),
                        )),
                    Expanded(
                      child: TextFormField(
                  onFieldSubmitted: (value) {
                    Provider.of<SearchProvider>(context, listen: false).searchapi(search_value_controller.text);
                  },
                            /* searchresult.clear();
                          for (int i = 0; i < searchlist.length; i++) {
                            if (value== searchlist[i][0] || value == searchlist[i]) {
                              setState(() {
                                searchresult.add(searchlist[i]);
                                print(searchresult);
                                 if(index < 2){
                                   index = index+1;
                                 }
                                searchhpages[index - 1] = !searchhpages[index - 1];
                                searchhpages[index] = !searchhpages[index];
                              });
                            }
                            else {
                                setState(() {

                                });

                              print("nosearchfound");


                            }
                          }*/



                          textAlignVertical: TextAlignVertical.top,
                          enableInteractiveSelection: false,
                          cursorColor: AppTheme.PrimaryColor,
                          controller: search_value_controller,

                          // expands: true,

                          decoration: InputDecoration(
                            hintText: AppStrings.search2,
                            hintStyle: TextStyle(
                                fontSize: 15,
                                color: AppTheme.lightunclickedColor),
                            prefixIcon: Image.asset(
                              AppImages.search,
                              height: 5,
                              width: 2,
                            ),
                            suffixIconColor: AppTheme.PrimaryColor,
                            suffixIcon: IconButton(
                              onPressed:

                              search_value_controller.clear,

                              icon: Icon(Icons.clear),
                            ),
                            focusedBorder: OutlineInputBorder(
                              // borderSide: BorderSide(color:  ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            contentPadding: EdgeInsets.fromLTRB(17, 14, 17, 17),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide:
                              BorderSide(color: AppTheme.PrimaryColor),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              Provider.of<SearchProvider>(context,).searchhpages[0] == true ? Expanded(
                child: Column(
                  children: [
                    recent_searches(),
                    popular_searches(),
                  ],
                ),
              ) : searchresults()
            ],

          );
        }
      ),
    ),
    );
  }

jobtype(int index1 , int index2,int index3){
    double height = 32.sp;
    double width = 85.sp;
    double padding1 =20;
    double padding2 =0;
  return Row(
    children: [
      InkWell(
        onTap: () {
          setState(() {
            selection[index1] = !selection[index1];

          });
        },
        child: Container(
          alignment: AlignmentDirectional.center,
          height: height,
          width: width,
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
            padding: EdgeInsets.fromLTRB(padding1,7, padding2,5),
            child: Row(
              children: [


                Text(names[index1],style: TextStyle(fontWeight: FontWeight.w400),textAlign: TextAlign.center,),
              ],
            ),
          ),
        ),
      ),
      SizedBox(width: 5,),
      InkWell(
        onTap: () {
          setState(() {
            selection[index2] = !selection[index2];


          });
        },
        child: Container(
          alignment: AlignmentDirectional.center,
          height: height,
          width: width,
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
            padding: EdgeInsets.fromLTRB(padding1,7, padding2,5),
            child: Row(
              children: [


                Text(names[index2],style: TextStyle(fontWeight: FontWeight.w400),),
              ],
            ),
          ),
        ),
      ),
      SizedBox(width:5,),
      InkWell(
        onTap: () {
          setState(() {
            selection[index3] = !selection[index3];


          });
        },
        child: Container(
          alignment: AlignmentDirectional.center,
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: selection[index3]
                  ? AppTheme.unclickedbackground
                  : AppTheme.PrimaryColorBackground,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                width: 1,
                color: selection[index3]
                    ? AppTheme.unclickedbuttonColor
                    : AppTheme.PrimaryColor,
              )),
          child: Padding(
            padding: EdgeInsets.fromLTRB(padding1,7, padding2,5),
            child: Row(
              children: [


                Text(names[index3],style: TextStyle(fontWeight: FontWeight.w400),),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
}

final List<bool> searchhpages = [true, false, false];
List<String> recentsearches = [];
List<Map> searchlist2 = [
  {'title' : 'a', 'location': 'Twitter • Jakarta, Indonesia ', 'salary': '\$10K'},
  //{'title' : "UI/UX Designer", "location": "Spectrum • Jakarta, Indonesia", "salary":"\$10K"},
 // {'title' : "Senior UI Designer", "location": "VK • Yogyakarta, Indonesia", "salary":"\$12K"},
 // {'title': "Junior UI Designer", "location": "Invision • Jakarta, Indonesia", "salary":"\$9K"},
 // {'title' : "Junior UI Designer", "location": "Behance • Surakarta, Indonesia", "salary":"\$12K"},
];
List<String> popularsearches = ["UI/UX Designer", "Project Manager", "Product Designer", "UX Designer", "Front-End Developer",];
List<String> searchlist = [
 'ab','a','b','c','d'

];
int index = 0;
List<String> searchresult = [];
final List<String> Time = [
  'Full Time',
  'Part Time',
];
final List<String> items = [
  'Item1',
  'Item2',
  'Item3',
  'Item4',
  'Item5',
  'Item6',
  'Item7',
  'Item8',
];
String? selectedValue;
Widget recent_searches() {
  return Flexible(
    child: Column(children: [
    title_container(
          title: AppStrings.recentsearches,
        ),
      SizedBox(height: 10,),
     Flexible(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 6,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(15,10,15,10),
              child:Row(
                children: [
                  Icon(Icons.access_time),
                  SizedBox(width: 10,),
                  Text("Junior UI Designer"),
                  Spacer(),
                  InkWell(
                      onTap: (){

                      },
                      child: Image.asset(AppImages.close,)),
                ],
              ),
            );
          },
        ),
      ), //list


    ]),
  );
}

Widget searchresults() {
  return  Consumer<SearchProvider>(
      builder: (context, value, child) {
        return Flexible(
          child:
          value.searchresults.length !=0 ? Column(
            children: [
              Row(
                children: [
                  InkWell(
                      onTap: (){

                      },

                      child: Image.asset(AppImages.settings)),
                  filters(),
                ],
              ),
              title_container(
                  title: AppStrings.Featuring + "  ${value.searchresults.length}+  " +
                      AppStrings.jobs),
              SizedBox(height: 10,),
              Container(
                child:
                Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: value.searchresults.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                              child: Container(
                                height: 120.sp,
                                width: 266.sp,
                                // color: Colors.red,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsets.fromLTRB(
                                              0, 0, 0, 20),
                                          child: Image.asset(
                                            AppImages.twitter,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          children: [
                                            headers(
                                              header1: value.searchresults[index].name.toString(),
                                              header2:value.searchresults[index].comp_name.toString()+ '•' +value.searchresults[index].location.toString(),
                                              haeder2size: 10,
                                              header1size: 15,
                                              sizedbox: 4.5,
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                     // save(job_id: value.searchresults[index].job_id),
                                        ///Todo save
],
                                    ),
                                    Row(
                                      children: [
                                        keywordss(value.searchresults[index].job_time_type.toString()),
                                        SizedBox(width: 5,),
                                        keywordss(value.searchresults[index].job_type.toString()),
                                        SizedBox(width: 5,),
                                        Spacer(),
                                        Text("\$"+value.searchresults[index].salary.toString(), style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13.sp),
                                          textAlign: TextAlign.end,),
                                        Text("/Month", style: TextStyle(
                                            color: AppTheme.unclickedColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 8.sp),
                                            textAlign: TextAlign.end),


                                      ],
                                    ),
                                    SizedBox(width: 10,),
                                    Divider(
                                      thickness: 1.5,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    )),

              )
            ],)

              : Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              children: [
                filters(),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: success_widget(header1: AppStrings.searchnotfound,
                    header2: AppStrings.searchnotfounddetails,
                    image: AppImages.searchnotfound,
                    headersize2: 14,),
                )
              ],
            ),
          ),


        );

      }
  );

}

Widget searchnotfound() {
  return Image.asset("");
}

Widget popular_searches() {
  return Flexible(
    child: Column(children: [
        title_container(
            title: AppStrings.popularsearches,
          ),
        SizedBox(height: 10,),
        Flexible(
          child: ListView.builder(
            itemCount: popularsearches.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(15,10,15,10),
                child: Row(
                  children: [
                   Image.asset(AppImages.searchstatus),
                    SizedBox(width: 10,),
                    Text(popularsearches[index]),
                    Spacer(),
                    InkWell(
                      onTap: (){},
                        child: Image.asset(AppImages.arrowbackecircle,)),
                  ],
                ),
              );
            },
          ),
        ), //list


      ]),
  );
}
Widget filters(){
  double height =35;
  double width =105;
  return Padding(
    padding: const EdgeInsets.fromLTRB(15, 0, 0, 15),
    child: Row(
      children: [

        CustomDropdownButton2(
          hint:
          'Remote',

          buttonWidth:width,
buttonHeight: height,
          dropdownItems: items,
          icon: const Icon(
            Icons.keyboard_arrow_down_sharp,
          ),

          iconSize: 20.sp,
          value: selectedValue,
          buttonDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
 //color: AppTheme.darkblue,
            border: Border.all(

              color: AppTheme.lightunclickedColor,
            ),
          ),
          onChanged: (value) {
            /*  setState(() {
                      selectedValue = value;
                    });*/
          },
        ),
        CustomDropdownButton2(
          hint:
          'Full Time',
          buttonWidth:width,
          buttonHeight: height,
          dropdownItems: items,
          icon: const Icon(
            Icons.keyboard_arrow_down_sharp,
          ),

          iconSize: 20.sp,
          value: selectedValue,
          buttonDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            //color: AppTheme.darkblue,
            border: Border.all(

              color: AppTheme.lightunclickedColor,
            ),
          ),
          onChanged: (value) {
            /*  setState(() {
                      selectedValue = value;
                    });*/
          },
        ),
        CustomDropdownButton2(
          hint:
          'Post Date',
          buttonWidth:width,
          buttonHeight: height,
          dropdownItems: items,
          icon: const Icon(
            Icons.keyboard_arrow_down_sharp,
          ),

          iconSize: 20.sp,
          value: selectedValue,
          buttonDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            //color: AppTheme.darkblue,
            border: Border.all(

              color: AppTheme.lightunclickedColor,
            ),
          ),
          onChanged: (value) {
            /*  setState(() {
                      selectedValue = value;
                    });*/
          },
        ),
      ],
    ),
  );
}
/// TOdo back to recent searches and search and filter with more than just the title
