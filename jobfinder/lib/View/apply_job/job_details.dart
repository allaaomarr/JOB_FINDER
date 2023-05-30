import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobfinder/View/apply_job/apply_job.dart';
import 'package:jobfinder/View/widgets/main_button.dart';
import 'package:jobfinder/utilities/app_strings.dart';
import 'package:sizer/sizer.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../styles/app_theme.dart';
import '../../utilities/app_images.dart';
import '../widgets/headers.dart';

class job_details extends StatefulWidget {
  const job_details({Key? key}) : super(key: key);

  @override
  State<job_details> createState() => _job_detailsState();
}
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
final List<bool> _selectedbutton= <bool>[true, false, false];
var selectedIndex = 0;
class _job_detailsState extends State<job_details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: ImageIcon(
                      AssetImage(AppImages.arrowback),
                    )),
                Spacer(),
                Text(AppStrings.jobdetails,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    )),
                Spacer(),
                IconButton(
                    onPressed: () {
                   //   Navigator.pop(context);
                    },
                    icon: ImageIcon(
                      AssetImage(AppImages.save),
                    )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Column(children: [
              Image.asset(
                AppImages.twitter,
              ),
              SizedBox(
                height: 10,
              ),
              headers(
                header1: "Senior UI Designer",
                header2: "Twitter • Jakarta, Indonesia ",
                haeder2size: 11,
                header1size: 18,
                sizedbox: 4.5,
                align2: AlignmentDirectional.center,
              ),

            ]),
      /*   Keywords_Grid(
                backgroundcolor: AppTheme.PrimaryColorBackground,
                textcolor: AppTheme.PrimaryColor,
                size: 3.5,
                count: 3),*/

              Padding(
                padding:  EdgeInsets.fromLTRB(40.sp, 0, 40.sp, 10),
                child: Row(
                 crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    keywords('Fulltime'),
                    SizedBox(width: 10,),
                    keywords('OnSite'),
                    SizedBox(width: 10,),
                    keywords('Senior'),
                  ],
                ),
              ),


            SizedBox(height: 10,),
            ToggleSwitch(
              changeOnTap: true,
              minWidth: 150.0.sp,
              cornerRadius: 20.0,
              minHeight: 35.sp,
              activeBgColors: [
                [AppTheme.darkblue],
                [AppTheme.darkblue],
                [AppTheme.darkblue]
              ],
              activeFgColor: Colors.white,
              inactiveBgColor: AppTheme.unclickedbackground,
              inactiveFgColor: AppTheme.unclickedColor,
              initialLabelIndex: selectedIndex,
              totalSwitches: 3,
              labels: [
                AppStrings.description,
                AppStrings.company,
                AppStrings.people,
              ],
              radiusStyle: true,
              onToggle: (index) {
                selectedIndex = index!;
                print('switched to: $index');
             setState(() {
               for (int i = 0; i < _selectedbutton.length; i++) {
              _selectedbutton[i] = i == index;

               }
             });
              },
            ),
   Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
            child:
     _selectedbutton[0] ? Description() :_selectedbutton[1]? Company() : People()


              ),
            ),
            InkWell(
              onTap: (){
             //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>apply_job(),));
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: main_button(label: AppStrings.applynow,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 Widget keywords (String text)
 {
   return Container(
   height: 25.sp,
   //width: 80.sp,
   alignment: AlignmentDirectional.center,
 decoration: BoxDecoration(
 color: AppTheme.PrimaryColorBackground,
 borderRadius: BorderRadius.circular(50),
 ),
 child: Padding(
   padding: const EdgeInsets.fromLTRB(20, 9, 20, 9),
   child: Text(
   text,
   textAlign: TextAlign.center,
   style: TextStyle(
   color: AppTheme.PrimaryColor,
   fontSize: 13,
   fontWeight: FontWeight.w400),
   ),
 ),
 );
 }
 Widget Description(){
  return
    ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppStrings.jobdescription,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14.sp),),
                SizedBox(height: 10,),
                Text(
                    "Your role as the UI Designer is to use interactive components on various platforms (web, desktop and mobile). This will include producing high-fidelity mock-ups, iconography, UI illustrations/graphics, and other graphic elements. As the UI Designer, you will be supporting the wider design team with the internal Design System, tying together the visual language. You will with other UI and UX Designers, Product Managers, and Engineering teams in a highly customer-focused agile environment to help define the vision of the products."),
                SizedBox(height: 10,),
                Text(AppStrings.skills,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14.sp),),
                SizedBox(height: 10,),
                Text("A strong visual portfolio with clear understanding of UI methodologies Ability to create hi-fidelity mock-ups in FigmaAbility to create various graphics for the web e.g. illustrations and iconsAble to facilitate workshops and liaise with stakeholdersProficiency in the Adobe Creative SuiteConfident communicator with an analytical mindsetDesign library/Design system experience4+ years of commercial experience in UI/Visual Design")
              ],
            ));
      },
    );
 }
 Widget Company(){
  return ListView.builder(
    itemCount: 1,
    itemBuilder: (context, index) {
      return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppStrings.contactus,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14.sp),),
              SizedBox(height: 10,),
              Row(
                children: [
                  Container(
                    alignment: AlignmentDirectional.topStart,
                    height: 50.sp,
                    width: 130.sp,

                    child: Padding(
                      padding: const EdgeInsets.all(10),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [



                          Container(
                              alignment: AlignmentDirectional.topStart,
                              child: Text(AppStrings.Email,style: TextStyle(color:AppTheme.lightunclickedColor ,fontSize: 10,),textAlign :TextAlign.start)),
                          SizedBox(height: 6,),
                          Container(
                              alignment: AlignmentDirectional.topStart,
                              child: Text("twitter@mail.com",style: TextStyle( fontSize: 15,fontWeight: FontWeight.w500),)),

                        ],
                      ),

                    ),
                    decoration: BoxDecoration(
                      // color:  widget.color,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: AppTheme.lightunclickedColor
                        )
                    ),

                  ),
                  Spacer(),
                  Container(
                    alignment: AlignmentDirectional.topStart,
                    height: 50.sp,
                    width: 130.sp,

                    child: Padding(
                      padding: const EdgeInsets.all(10),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [



                          Container(
                              alignment: AlignmentDirectional.topStart,
                              child: Text(AppStrings.website,style: TextStyle(color:AppTheme.lightunclickedColor ,fontSize: 10,),textAlign :TextAlign.start)),
                          SizedBox(height: 6,),
                          Container(
                              alignment: AlignmentDirectional.topStart,
                              child: Text("https://twitter.com",style: TextStyle( fontSize: 15,fontWeight: FontWeight.w500),)),

                        ],
                      ),

                    ),
                    decoration: BoxDecoration(
                      // color:  widget.color,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: AppTheme.lightunclickedColor
                        )
                    ),

                  ),
                ],
              ),
              SizedBox(height: 10,),
              Text(AppStrings.aboutcompany,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14.sp),),
              SizedBox(height: 10,),
              Text("Understanding Recruitment is an award-winning technology, software and digital recruitment consultancy with headquarters in St. Albans, Hertfordshire.We also have a US office in Boston, Massachusetts specialising in working closely with highly skilled individuals seeking their next career move within Next Gen Tech, Backend Engineering, and Artificial Intelligence.We recently celebrated our first decade in business and over the years have been recognised with several industry awards including 'Best Staffing Firm to Work For 2018'​ at the SIA Awards for the third consecutive year and ‘Business of the Year 2017’ at the SME Hertfordshire Business Awards.Our teams of specialists operate across all areas of Technology and Digital, including Java, JavaScript, Python, .Net, DevOps & SRE, SDET, Artificial Intelligence, Machine Learning, AI, Digital, Quantum Computing, Hardware Acceleration, Digital, Charity, Fintech, and the Public Sector.")
            ],
          ));
    },
  );
 }
 Widget People(){
  return Column(
    children: [
      Row(
        children: [ 
          headers(header1: "6 Employees For", header2: "UI/UX Design",align2: AlignmentDirectional.topStart,align: CrossAxisAlignment.start,haeder2size: 10,header1size: 12,sizedbox: 5,sizedbox2: 6,),
   Spacer(),
          CustomDropdownButton2(
            hint:
   'UI/UX Designer',
            buttonWidth: 150,

            dropdownItems: items,
            icon: const Icon(
              Icons.keyboard_arrow_down_sharp,
            ),

            iconSize: 15.sp,
            value: selectedValue,
            buttonDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),

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
      Expanded(
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
Image.asset("images/DimasProfile.png"),
                          Spacer(),
headers(header1: "Dimas Adi Saputro", header2: "Senior UI/UX Designer at Twitter",header1size: 12,haeder2size: 10,align: CrossAxisAlignment.start,align2: AlignmentDirectional.topStart,sizedbox: 5,sizedbox2: 6,),
Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
  children: [
    Text(AppStrings.workduring,style: TextStyle(color:  AppTheme.lightunclickedColor,fontSize: 10.sp),),
    SizedBox(height: 10,),
    Text("5 Years",style: TextStyle(color:  AppTheme.PrimaryColor,fontSize: 10.sp),),
  ],
)
                            ],
                          ),
                      Divider(thickness: 1.5,),
                    ],
                  ),
                ),

                );
          },
        ),
      )
    ],
  );
 }