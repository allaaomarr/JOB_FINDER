import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobfinder/View/applied_jobs/applied_jobs.dart';
import 'package:jobfinder/View/home_search/home_page.dart';
import 'package:jobfinder/View/messages/messages.dart';
import 'package:jobfinder/View/profile/profile_page.dart';
import 'package:jobfinder/View/saved_jobs/saved_jobs.dart';
import 'package:jobfinder/utilities/route/routes.dart';

import '../../styles/app_theme.dart';
import '../../utilities/app_images.dart';

class bottom_nav_bar extends StatefulWidget {

int currentIndex;
 bottom_nav_bar({required this.currentIndex});

  @override
  State<bottom_nav_bar> createState() => _bottom_nav_barState();
}

class _bottom_nav_barState extends State<bottom_nav_bar> {

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      //   onTap: (i) => setState(() => _currentIndex = 1),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppTheme.PrimaryColor,
      unselectedIconTheme: IconThemeData(color: AppTheme.lightunclickedColor),
      selectedIconTheme: IconThemeData(color: AppTheme.PrimaryColor),
      items: [

        BottomNavigationBarItem(icon: InkWell(
          onTap: (){
          Navigator.push(
              context,  MaterialPageRoute(
              builder: (context) =>home_page()
           ));
          },
          child: ImageIcon(
            AssetImage(AppImages.home),
          ),
        ),label: "Home",

        ),
        BottomNavigationBarItem(icon:
        InkWell(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => messages(),
                  ));
            },
       child: ImageIcon(
          AssetImage(AppImages.messages),
        )),label: "Messages"),
        BottomNavigationBarItem(icon:
    InkWell(
    onTap: (){
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => applied_jobs(),
    ));
    },
      child:  ImageIcon(
          AssetImage(AppImages.applied),
        ),),label: "Applied"),
        BottomNavigationBarItem(icon: InkWell(
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => saved_jobs(),
                ));
          },
          child: ImageIcon(
            AssetImage(AppImages.save),
          ),
        ),label: "Saved"),
   BottomNavigationBarItem(icon:
   InkWell(
     onTap: (){
       Navigator.push(
           context,
           MaterialPageRoute(
             builder: (context) => profile_page(),
           ));
     },
     child :ImageIcon(
          AssetImage(AppImages.profile),),
        ),label: "Profile",),

      ],
    );
  }
}
