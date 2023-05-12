import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:jobfinder/View/widgets/arrowback_title.dart';
import 'package:jobfinder/View/widgets/bottom_nav_bar.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Controller/data/Network/dio.dart';
import '../../styles/app_theme.dart';
import '../../utilities/app_images.dart';
import '../../utilities/app_strings.dart';
import '../saved_jobs/saved_jobs.dart';
import '../widgets/headers.dart';
import '../widgets/notification_messages_Container.dart';
import '../widgets/success_widget.dart';
import '../widgets/title_container.dart';
import 'chat.dart';

class messages extends StatefulWidget {
  const messages({Key? key}) : super(key: key);

  @override
  State<messages> createState() => _messagesState();
}
List<Map> chatList = [
  {'name': 'Twitter', 'detail': 'Here is the link: http://zoom.com/abcdeefg',  'image': "images/Twittercircle.png"}, {'name': 'Gojek Indonesia', 'detail': 'Let’s keep in touch.','image': "images/Gojek.png", },
{'name': 'Shoope', 'detail': 'Let’s keep in touch.','image':  "images/Shoope.png", },
{'name': 'Dana', 'detail': 'Thank you for your attention!','image': "images/Dana.png", },
{'name': 'Slack', 'detail': 'Let’s keep in touch.', 'image': "images/Slack.png", },
{'name': 'Facebook', 'detail': 'You: What about the interview stage?', 'image': "images/facebookbig.png", },
];
bool filterunread = false;
class _messagesState extends State<messages> {
  @override
  Widget build(BuildContext context) {
    var search_value_controller= TextEditingController();
    return Scaffold(
      body :
        SafeArea
          (
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
               arrowback_title(title: AppStrings.messages),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(

                          onFieldSubmitted: (value){



                            },
                          textAlignVertical: TextAlignVertical.top,
                          enableInteractiveSelection: false,
                          cursorColor: AppTheme.PrimaryColor,
                          controller: search_value_controller,

                          // expands: true,

                          decoration: InputDecoration(


                            hintText: AppStrings.searchmessages,
                            hintStyle: TextStyle(
                                fontSize: 15,
                                color: AppTheme.lightunclickedColor),
                            prefixIcon: Image.asset(
                              AppImages.search,
                              height: 5,
                              width: 2,
                            ),
                            suffixIconColor: AppTheme.PrimaryColor,
                            suffixIcon:IconButton(
                              onPressed:
                              search_value_controller.clear,


                              icon: Icon(Icons.clear,color: AppTheme.unclickedColor,),

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
                    SizedBox(width: 9,),
                    Container(
                      height: 47,
                      width: 47,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(47),
                        border: Border.all(
                          color: AppTheme.unclickedColor,
                        )
                      ),
                      child: IconButton(icon:
                   ImageIcon(AssetImage(AppImages.filter,)
                        ,size: 100,), onPressed: () {
                        showAdaptiveActionSheet(
                             title: Text(AppStrings.messagefilter,textAlign: TextAlign.right,) ,
                          context: context,
                          actions: <BottomSheetAction>[
                            BottomSheetAction(
                              title:  bottom_sheet_container(title:AppStrings.Unread,image: AppImages.messages),
                              onPressed: (_) {
                               filterunread == !filterunread;
                              },
                            ),
                            BottomSheetAction(
                              title: bottom_sheet_container(title:AppStrings.spam,image: AppImages.messages),
                              onPressed: (_) {},
                            ),
                            BottomSheetAction(
                                title: bottom_sheet_container(title:AppStrings.Archived,image: AppImages.messages),
                                onPressed: (_) {
                                  GetChat();
                                }
                            ),
                          ],
                       cancelAction: CancelAction(title: const Text('Cancel')),
                        ); },),
                    )
                  ],
                ),
            ),

                Flexible(
                  // flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: filterunread! ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: (){  Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => chat(name : chatList[index]['name'],image:chatList[index]['image']),
                                ));},
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.asset(chatList[index]['image'],),
                                    SizedBox(width: 15,),


                                        notification_messages_conatiner(header1: chatList[index]['name'], header2: chatList[index]['detail'],header1size: 13,haeder2size: 11,align: CrossAxisAlignment.start,sizedbox: 5,sizedbox2: 0,),







                                  ],
                                ),
                                Divider(thickness: 1,indent: 60,),
                              ],

                            ),
                          ),
                        );
                      },) : unread(),
                  ),
                ),

              ],
            ),
          ),
        ),
      bottomNavigationBar: bottom_nav_bar(currentIndex: 1,),
    );
  }
}
Widget no_messages(){
  return success_widget(header1: AppStrings.nomessages, header2:AppStrings.nomessagesdetails, image: AppImages.nomessages);
}
Widget unread(){
  return Column(
    children: [
    Container(
    width: 300.sp,
    height: 30.sp,


    decoration: BoxDecoration(
        color: AppTheme.titlecontainer,
        border:  Border.all(
          color: AppTheme.bordertitlecontainer,
        )
    ),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
      child: Row(
        children: [
          Text(AppStrings.Unread,style: TextStyle(color: AppTheme.unclickedColor),textAlign: TextAlign.start,),
          TextButton(child: Text(AppStrings.Readallmessages,style: TextStyle(color: AppTheme.PrimaryColor),textAlign: TextAlign.start,),onPressed: (){},),
        ],
      ),
    ),

  ),
      /// TODO LIST OF UNREAD MESSAGES
    ],
  );
}