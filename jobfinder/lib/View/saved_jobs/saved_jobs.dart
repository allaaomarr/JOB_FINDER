import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobfinder/Controller/data/Network/dio.dart';
import 'package:jobfinder/View/widgets/bottom_nav_bar.dart';
import 'package:jobfinder/View/widgets/success_widget.dart';
import 'package:jobfinder/View/widgets/title_container.dart';
import 'package:provider/provider.dart';
import '../../Controller/Provider/saved_jobs_provider.dart';
import '../../styles/app_theme.dart';
import '../../utilities/app_images.dart';
import '../../utilities/app_strings.dart';
import '../widgets/arrowback_title.dart';
import '../widgets/headers.dart';

class saved_jobs extends StatefulWidget {
  const saved_jobs({Key? key}) : super(key: key);

  @override
  State<saved_jobs> createState() => _saved_jobsState();
}

class _saved_jobsState extends State<saved_jobs> {
  @override
  void initState() {
    super.initState();
 WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<SavedJobsProvider>(context,listen: false).save_job();
      print(Provider.of<SavedJobsProvider>(context,listen: false).save_job());


 });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column
          (children: [
          arrowback_title(title: AppStrings.saved),
          title_container(title:  Provider.of<SavedJobsProvider>(context,listen: false).savedjobs.length.toString()+"  "+AppStrings.jobsaved,align: TextAlign.center,),
    Consumer<SavedJobsProvider>(
    builder: (context, value, child) {
            return
              Expanded(

                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListView.builder(
                        itemCount: value.savedjobs.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(

                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 20),
                                        child: Image.asset(
                                          AppImages.twitter, height: 40,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        children: [
                                          headers(
                                            header1: value.savedjobs[index].name
                                                .toString(),
                                            header2: value.savedjobs[index]
                                                .location.toString(),
                                            haeder2size: 1,
                                            header1size: 15,
                                            sizedbox: 4.5,
                                            sizedbox2: 15,
                                            align: CrossAxisAlignment.start,
                                          ),
                                        ],
                                      ),

                                      Spacer(),
                                      IconButton(icon: Icon(Icons.more_horiz),
                                        onPressed: () {
                                          showAdaptiveActionSheet(

                                            context: context,
                                            actions: <BottomSheetAction>[
                                              BottomSheetAction(
                                                title: bottom_sheet_container(
                                                  image: AppImages.apply,
                                                  title: AppStrings.applyjob,),
                                                onPressed: (_) {},
                                              ),
                                              BottomSheetAction(
                                                title: bottom_sheet_container(
                                                  image: AppImages.share,
                                                  title: AppStrings.share,),
                                                onPressed: (_) {},
                                              ),
                                              BottomSheetAction(
                                                  title: bottom_sheet_container(
                                                    image: AppImages.save,
                                                    title: AppStrings
                                                        .cancelsave,),
                                                  onPressed: (_) {
                                                    Provider.of<
                                                        SavedJobsProvider>(
                                                        context, listen: false)
                                                        .delete_job(
                                                        value.savedjobs[index]
                                                            .favid);
                                                   Provider
                                                        .of<SavedJobsProvider>(
                                                        context, listen: false)
                                                        .save_job();

                                                  }
                                              ),
                                            ],
                                            cancelAction: CancelAction(
                                                title: const Text('Cancel')),
                                          );
                                        },)

                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Posted 2 days ago", style: TextStyle(
                                          color: AppTheme.unclickedColor,
                                          fontSize: 13),),
                                      Spacer(),
                                      Icon(
                                        Icons.access_time, color: Colors.green,
                                        size: 13,),
                                      SizedBox(width: 5,),
                                      Text("Be an early applicant",
                                          style: TextStyle(
                                              color: AppTheme.unclickedColor,
                                              fontSize: 13)),
//
                                    ],
                                  ),
                                  //SizedBox(width: 10,),
                                  Divider(
                                    thickness: 1.5,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                    ),

                ),
              );}
          ),
],
        ),
      ),
      bottomNavigationBar: bottom_nav_bar(currentIndex: 3,),
    );
  }
}
  Widget bottom_sheet_container({String? image , required String title ,})
 {
   return
   Container(
     height: 50,
     child: Padding(
       padding: const EdgeInsets.all(10),
       child: Row(children: [
         Image.asset(image!),
         SizedBox(width: 10,),
         Text(title,style: TextStyle(fontSize: 15),),
         Spacer(),
         IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_rounded,size: 20,)),
       ],),
     ),
     decoration:BoxDecoration(
       //  color: AppTheme.unclickedColor,
       borderRadius: BorderRadius.circular(50),
       border: Border.all(
           color: AppTheme.lightunclickedColor
       ),
     ), );
 }
 Widget nothing_saved ()
 {
   return success_widget(header1: AppStrings.nothingsaved, header2: AppStrings.nothingsaveddetails, image: AppImages.nothingsaved);
 }
