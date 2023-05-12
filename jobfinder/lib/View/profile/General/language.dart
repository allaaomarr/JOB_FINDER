import 'package:easy_stepper/easy_stepper.dart';
import 'package:jobfinder/Controller/data/Network/dio.dart';
import 'package:jobfinder/View/widgets/arrowback_title.dart';
import 'package:jobfinder/utilities/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utilities/app_images.dart';
class language extends StatefulWidget {
  const language({Key? key}) : super(key: key);

  @override
  State<language> createState() => _languageState();
}
List <String> languages =[
  "English",
  "Indonesia",
  "Arabic",
  "Chinese",
  "Dutch",
  "French",
  "German",
  "Japanese",
  "Korean",
  "Portuguese",
];
List<String> images = [

  "images/England.png",
  "images/Indonesian.png",
  "images/Arabic.png",
  "images/Chinese.png",
  "images/Dutch.png",
  "images/French.png",
  "images/German.png",
  "images/Japanese.png",
  "images/Korean.png",
  "images/Portuguese.png",
];

List <bool> choose =[
 true,
  true,
  true,
  true,
  true,
  true,
  true,
  true,
  true,
  true
  
];
class _languageState extends State<language> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            arrowback_title(title:AppStrings.Language),
Expanded(child: Padding(
  padding: const EdgeInsets.fromLTRB(20,0,20,0),
  child:   ListView.builder(

    itemCount: languages.length,

    itemBuilder: (context, index) {

    return Column(

      children: [

        Row(

          children: [

            Image.asset(

             images[index],

            ),
           SizedBox(width: 15,),
            Text(languages[index],style: TextStyle(fontWeight: FontWeight.w500),),

            IconButton(onPressed: (){

      setState(() { choose[index]=!choose[index];
putDatalanguage(languages[index]);
///provider

      });

      },



       icon: Image.asset(

              choose[index]  ?

   AppImages.circle:AppImages.checkcircle,

      ),

            )

          ],

        ),

        Divider(thickness: 1,),

      ],

    );

  },),
))
          ],
        ),
      ),
    );
  }
}