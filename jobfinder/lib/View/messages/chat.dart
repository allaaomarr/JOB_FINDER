import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:jobfinder/Controller/data/Network/dio.dart';
import 'package:sizer/sizer.dart';

import '../../styles/app_theme.dart';
import '../../utilities/app_images.dart';
import '../../utilities/app_strings.dart';
import '../saved_jobs/saved_jobs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class chat extends StatefulWidget {
  String name;
  String image;
  chat({required this.name, required this.image});
  bool user1 = true;
  bool user2 = true;
  @override
  State<chat> createState() => _chatState();
}

List<String> user1 = [
  "Hi Rafif!, I'm Melan the selection team from Twitter. Thank you for applying for a job at our company. We have announced that you are eligible for the interview stage.",
  "Can we have an interview via google meet call today at 3pm?",
  "Ok, here I put the google meet link for later this afternoon. I ask for the timeliness, thank you! https://meet.google.com/dis-sxdu-ave"
];
List<String> user2 = [
  "Hi Melan, thank you for considering me, this is good news for me.",
  "Of course, I can!",
];

class _chatState extends State<chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: ImageIcon(
                      AssetImage(AppImages.arrowback),
                    )),
                SizedBox(
                  width: 10,
                ),
                Container(
                  alignment: AlignmentDirectional.center,
                  child: Row(
                    children: [
                      Image.asset(
                        widget.image,
                        height: 35,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        widget.name,
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                    width: 30.sp,
                    child: IconButton(
                      onPressed: () {
                        showAdaptiveActionSheet(
                          title: Text(
                            AppStrings.messagefilter,
                            textAlign: TextAlign.right,
                          ),
                          context: context,
                          actions: <BottomSheetAction>[
                            BottomSheetAction(
                              title: bottom_sheet_container(
                                title: AppStrings.Visitjobpost,image: AppImages.applied,
                              ),
                              onPressed: (_) {},
                            ),
                            BottomSheetAction(
                              title: bottom_sheet_container(title:AppStrings.Viewmyapplication,image:AppImages.note,),
                              onPressed: (_) {},
                            ),
                            BottomSheetAction(
                              title: bottom_sheet_container(title:AppStrings.Markasunread,image:AppImages.sms,),
                              onPressed: (_) {},
                            ),
                            BottomSheetAction(
                              title: bottom_sheet_container(title:AppStrings.Mute,image:AppImages.notification,),
                              onPressed: (_) {},
                            ),
                            BottomSheetAction(
                              title: bottom_sheet_container(title:AppStrings.Archive,image:AppImages.uploadfile,),
                              onPressed: (_) {
                                postuserChat();
                              //  GetChat();
                              },
                            ),
                            BottomSheetAction(
                              title: bottom_sheet_container(title:AppStrings.Deleteconversation,image:AppImages.delete,),
                              onPressed: (_) {},
                            ),
                          ],
                          // cancelAction: CancelAction(title: const Text('Cancel')),
                        );
                      },
                      icon: Icon(Icons.more_horiz),
                    ))
              ],
            ),
          ),
          Divider(
            thickness: 1.5,
          ),
          Flexible(
            child: Container(
              color: Colors.grey[100],
              child: ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                      padding: const EdgeInsets.all(20),
                      child: index == user2.length
                          ? Recevier(user1[index])
                          : Column(
                              children: [
                                Recevier(user1[index]),
                                SizedBox(
                                  height: 40,
                                ),
                                sender(user2[index])
                              ],
                            ));
                },
              ),
            ),
          ),
        ]),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20,5,20,5),
        child: Row(
          children: [
            circle_button(AppImages.clip),
            Flexible(
              child: TextFormField(

                  //textAlignVertical: TextAlignVertical.top,
                  enableInteractiveSelection: false,
                  cursorColor: AppTheme.PrimaryColor,
                  maxLines: 5, // <-- SEE HERE
                  minLines: 1,
                  // validator: (s) => widget.validate!(s),
                  // controller: widget.controller,

                  decoration: InputDecoration(
                    filled: true,
                    hintText: "Write a message...",

                    hintStyle: TextStyle(
                        fontSize: 14, color: AppTheme.lightunclickedColor),
                   focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppTheme.PrimaryColor),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),

                        borderSide: BorderSide(
                            color: AppTheme.unclickedbuttonColor)),



                    ),
                  )),

            circle_button(AppImages.voicenote),
          ],
        ),
      ),
    );
  }
}

Widget Recevier(String message) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
    child: Container(
      child: Padding(
        padding: const EdgeInsets.all(11),
        child: Column(
          children: [
            Text(
              message,
              style: TextStyle(fontSize: 15),
            ),
            Container(
                alignment: AlignmentDirectional.bottomEnd,
                child: Text(
                  "10.18",
                  style:
                      TextStyle(color: AppTheme.unclickedColor, fontSize: 13),
                  textAlign: TextAlign.left,
                )),
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: AppTheme.bordertitlecontainer,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
    ),
  );
}

Widget sender(String message) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
    child: Container(
      child: Padding(
        padding: const EdgeInsets.all(11),
        child: Column(
          children: [
            Container(
                alignment: AlignmentDirectional.topStart,
                child: Text(message,
                    style: TextStyle(fontSize: 15, color: Colors.white),
                    textAlign: TextAlign.left)),
            Container(
                alignment: AlignmentDirectional.bottomEnd,
                child: Text(
                  "10.18",
                  style: TextStyle(color: Colors.white, fontSize: 13),
                )),
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: AppTheme.PrimaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
    ),
  );
}

Widget circle_button(String image) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(47),
          border: Border.all(
            color: AppTheme.lightunclickedColor,
          )),
      child: IconButton(
        icon: ImageIcon(
          AssetImage(
            image,
          ),
          size: 100,
        ),
        onPressed: () {},
      ),
    ),
  );
}
