import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobfinder/View/home_search/search_page.dart';
import 'package:jobfinder/View/notification/notification.dart';
import 'package:jobfinder/View/widgets/headers.dart';
import 'package:jobfinder/styles/app_theme.dart';
import 'package:jobfinder/utilities/app_images.dart';
import 'package:jobfinder/utilities/app_strings.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import '../../Controller/Provider/home_provider.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/save.dart';


class home_page extends StatefulWidget {

 home_page();

  @override
  State<home_page> createState() => _home_pageState();
}
List<String> keywords=
[
"FullTime",
"Remote"  ,
  "Design"
];
 int _currentIndex =0;
String?  username;

class _home_pageState extends State<home_page> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp)  {
      Provider.of<HomeProvider>(context,listen: false).Getsuggestedjobs();
      Provider.of<HomeProvider>(context,listen: false).Getjobs();
      getdata();


      //GetChat();
    });
  }
  Future<void> getdata()
async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
 username =  prefs.getString('name');
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        Consumer<HomeProvider>(
        builder: (context, value, child) {
          // if (value.isLoading) {
          // return const Center(
          //   child: CircularProgressIndicator(),
          //   );
          //  }
          ///todo circular indicator for all
          return
            SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            headers(
                              header1: "Hi,${username}👋",
                              header2: AppStrings.homepagetitledetails,
                              haeder2size: 12,
                              align: CrossAxisAlignment.start,
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => notification(),
                                    ));
                              },
                              child: Container(
                                  alignment: AlignmentDirectional.center,
                                  child: Image.asset(AppImages.notification)),
                            ),
                          ],
                        ),


                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>search_page(),));
                          },
                          child:
          Container(
          height: 37.sp,
          //width: 80.sp,
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
          //color: AppTheme.PrimaryColorBackground,
          borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: AppTheme.lightunclickedColor,
              width: 1
            )
          ),
          child: Padding(
          padding: const EdgeInsets.fromLTRB(9, 10, 9, 10),
          child: Row(
            children: [
          Image.asset(
          AppImages.search,
          height: 50,
          width: 45,
          ),
              Text(
              AppStrings.search,
              textAlign: TextAlign.center,
              style: TextStyle(
              color: AppTheme.lightunclickedColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400),
              ),
            ],
          ),
          ),
          ),





                        ),

                        Row(
                          children: [
                            Text(
                              AppStrings.SuggestedJobs,
                              style:
                              TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18),
                            ),
                            Spacer(),
                            TextButton(
                                onPressed: () {}, child: Text(
                                AppStrings.Viewall)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  //SUGGESTED JOBS
                  Container(
                    height: 173.sp,
                    child: Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: value.suggestjobs.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                                width: 260.sp,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: index.isEven ?
                                  AppTheme.darkblue : Color(0xffF4F4F5),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 20, 20, 0),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsets.fromLTRB(
                                                0, 0, 0, 10),
                                            child: Container(
                                              height: 55,
                                                width: 55,
                                                child: Image.asset('images/flutter.png'),
                                                //Image.network('https://scontent.fcai19-4.fna.fbcdn.net/v/t39.30808-6/341641761_2026393727719082_1890208254169215980_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=UjADs0suO50AX9yHMoc&_nc_ht=scontent.fcai19-4.fna&oh=00_AfBWUK_Ku3FuYpjdOgzmuqwfXcCaEJot2-MJkxKGYJKr5Q&oe=646395C3',width: 50,height: 50,),
                                decoration: BoxDecoration(


                          ),
                                          ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Column(
                                            children: [
                                              headers(
                                                header1:value.suggestjobs[index].name.toString(),
                                                header2:value.suggestjobs[index].comp_name.toString()+ " • " +value.suggestjobs[index].location.toString(),
                                                haeder2size: 8,
                                                header1size: 15,
                                                color: index.isEven ?
                                                Colors.white : Colors.black,
                                                sizedbox: 4.5,
                                                sizedbox2: 5,
                                                align: CrossAxisAlignment.start,
                                                align2: AlignmentDirectional.topStart,
                                                width: 170,
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          save(job_id: value.suggestjobs[index].jobid,
                                         image:
                                          index.isEven ?"images/save-white.png":
                                          AppImages.save ,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Keyword_Grid(
                                        index.isEven ?
                                        AppTheme.transparent : AppTheme
                                            .PrimaryColorBackground,
                                        index.isEven ?
                                        Colors.white : AppTheme.PrimaryColor,
                                        3.sp ,value.suggestjobs[index].job_time_type.toString(),value.suggestjobs[index].job_type.toString(),value.suggestjobs[index].job_level.toString()),
                                    SizedBox(height: 5,),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 0, 20, 20),
                                      child: InkWell(
                                        onTap: () {

                                        },
                                        child: Container(

                                          alignment: AlignmentDirectional
                                              .center,
                                          child: Row(
                                            children: [
                                              Text("\$"+value.suggestjobs[index].salary.toString(),
                                                style: TextStyle(
                                                    color: index.isEven ?
                                                    Colors.white : Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16.sp),),
                                              Text("/Month", style: TextStyle(
                                                  color: AppTheme.transparent,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 13.sp),),
                                              Spacer(),
                                              Padding(
                                                padding: const EdgeInsets
                                                    .fromLTRB(3, 0, 5, 0),
                                                child: InkWell(
                                                  onTap: () {
                                                  //  GetJobDetails(value.suggestjobs[index].jobid
                                                    //   );
                                              //  PostDataPortifolio('/C:/Users/Dell/Downloads/onboard2.jpeg', "cv");

                                               //
                                                   //   Navigator.push(context, MaterialPageRoute(builder: (context) => job_details(),));

                                                  },
                                                  child: Container(
                                                    height: 32.sp,
                                                    width: 96.sp,
                                                    alignment: AlignmentDirectional
                                                        .center,
                                                    decoration: BoxDecoration(
                                                      color: AppTheme
                                                          .PrimaryColor,
                                                      borderRadius: BorderRadius
                                                          .circular(50),
                                                    ),
                                                    child: Text(
                                                      AppStrings.applynow,
                                                      textAlign: TextAlign
                                                          .center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 13,
                                                          fontWeight: FontWeight
                                                              .w400),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          );
                        },
                      ),
                    ),
                  ),
                  // END OF SUGGESTED JOBS
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: Row(
                      children: [
                        Text(
                          AppStrings.RecentJobs,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                        Spacer(),
                        TextButton(
                            onPressed: () {}, child: Text(AppStrings.Viewall)),
                      ],
                    ),
                  ),
                  Container(
                    child: Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: value.alljobs.length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      15, 0, 15, 5),
                                  child: Container(
                                    height: 120.sp,
                                    width: 266.sp,
                                    // color: Colors.red,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding:
                                              const EdgeInsets.fromLTRB(
                                                  0, 0, 0, 20),
                                              child: Container(
                                                height: 50,
                                                width: 50,
                                                child: Image.network('https://scontent.fcai19-4.fna.fbcdn.net/v/t39.30808-6/341641761_2026393727719082_1890208254169215980_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=UjADs0suO50AX9yHMoc&_nc_ht=scontent.fcai19-4.fna&oh=00_AfBWUK_Ku3FuYpjdOgzmuqwfXcCaEJot2-MJkxKGYJKr5Q&oe=646395C3',width: 50,height: 50,),
                                                decoration: BoxDecoration(

                                                    borderRadius: BorderRadius.circular(1),
                                                    border: Border.all(
                                                      width: 1,
                                                      color:  AppTheme.unclickedbuttonColor,
                                                    )
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              children: [
                                                headers(
                                                  header1: value.alljobs[index].name.toString(),
                                                  header2:value.alljobs[index].comp_name.toString() + "  •  " + value.alljobs[index].location.toString(),
                                                  haeder2size: 8,
                                                  header1size: 15,
                                                  sizedbox: 4.5,
                                                  sizedbox2: 5,
                                                  align2: AlignmentDirectional.topStart,
                                                  align: CrossAxisAlignment.start,
                                                  width: 170,
                                                ),
                                              ],
                                            ),
                                            Spacer(),
                                           save(job_id: value.alljobs[index].jobid)
                                          ],
                                        ),

                                        Row(
                                          children: [
                                            keywordss(value.alljobs[index].job_time_type.toString()),
                                            SizedBox(width: 2,),
                                            keywordss(value.alljobs[index].job_type.toString()),
                                            SizedBox(width: 2,),
                                            keywordss(value.alljobs[index].job_level.toString()),

                                            SizedBox(width: 5,),

                                            Text("\$"+value.alljobs[index].salary.toString(), style: TextStyle(
                                                color: Colors.green,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12.sp),
                                              textAlign: TextAlign.end,),
                                            Text("/Month", style: TextStyle(
                                                color: AppTheme.unclickedColor,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 8.sp),
                                                textAlign: TextAlign.end),


                                          ],
                                        ),

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
                  ),
                ],
              ),

            );

        }
        ),
        bottomNavigationBar:
        bottom_nav_bar(currentIndex: 0,),
    );
  }
}

Widget Keyword_Grid(
    Color backgroundcolor, Color textcolor, double size,String keyword1 , String keyword2 , String keyword3) {
  List<String> keywordlist =[
    keyword1,
    keyword2,
    keyword3
  ];
  return Flexible(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: GridView.builder(
        shrinkWrap: true,
          itemCount: 3,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: size,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(3, 0, 5, 0),
              child: Container(

                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  color: backgroundcolor,
                  borderRadius: BorderRadius.circular(50),
                  //  border: Border.all(
                  //   width: 1.5,
                  // color:  AppTheme.unclickedbuttonColor,
                  //)
                ),
                child: Text(
                  keywordlist[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: textcolor,
                      fontSize: 13,
                      fontWeight: FontWeight.w400),
                ),
              ),
            );
          }),
    ),
  );
}
Widget keywordss (String text)
{
  return Container(
    //height: 25.sp,
    width: 60.sp,
    alignment: AlignmentDirectional.center,
    decoration: BoxDecoration(
      color: AppTheme.PrimaryColorBackground,
      borderRadius: BorderRadius.circular(50),
    ),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(9, 8, 9, 8),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: AppTheme.PrimaryColor,
            fontSize: 10.sp,
            fontWeight: FontWeight.w400),
      ),
    ),
  );
}