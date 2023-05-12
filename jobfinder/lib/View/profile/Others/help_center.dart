
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobfinder/styles/app_theme.dart';
import 'package:jobfinder/utilities/app_sizes.dart';
import 'package:jobfinder/utilities/app_strings.dart';

import '../../widgets/arrowback_title.dart';
class help_center extends StatefulWidget {
  const help_center({Key? key}) : super(key: key);

  @override
  State<help_center> createState() => _help_centerState();
}

class _help_centerState extends State<help_center> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            arrowback_title(title: AppStrings.HelpCenter,),
        Container(
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
             // color:  AppTheme.unclickedColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: AppTheme.lightunclickedColor
              )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: ExpandablePanel(
              header: Text(AppStrings.helpinfotitle,style: TextStyle(fontWeight: FontWeight.bold,fontSize: AppSizes.title1),),

             collapsed: Text("", softWrap: true, maxLines: 1, overflow: TextOverflow.ellipsis,),
              expanded: Text(AppStrings.helpinfotitledetails, softWrap: true, ),
             // tapHeaderToExpand: true,
            //  hasIcon: true,
            ),
          ),
        ),
          ],
        ),
      ),
    ));
  }
}
/// TODO  search bar and list