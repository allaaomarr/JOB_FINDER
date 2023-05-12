import 'package:easy_stepper/easy_stepper.dart';
import 'package:jobfinder/utilities/app_images.dart';
import 'package:jobfinder/utilities/app_sizes.dart';
import 'package:sizer/sizer.dart';

import '../../styles/app_theme.dart';
import 'headers.dart';

class experience_container extends StatefulWidget {
  String title ;
  String details;
  String start_date;
  String end_date;
  experience_container({required this.title , this.details = "CV.pdf 300KB",required this.start_date,required this.end_date});

  @override
  State<experience_container> createState() => _experience_containerState();
}

class _experience_containerState extends State<experience_container> {
  @override
  Widget build(BuildContext context) {
    return Container(

        decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 1.5,
              color:  AppTheme.unclickedbuttonColor,
            )
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(

                children: [
                  Image.asset(AppImages.pdf),
                  SizedBox(width: 20.sp,),
                  headers(header1: widget.title, header2: widget.details,sizedbox: 5,align: CrossAxisAlignment.start,align2: AlignmentDirectional.topStart,header1size: 13,haeder2size: 11,sizedbox2: 0,),

                  


                  /*    Container(
                                  //  height: 70,
                                  //  width: 50,
  child:   IconButton(onPressed: (){



  }, icon: Icon(Icons.radio_button_off)),
)*/
                ],
              ),

              Row(
                children: [


                  SizedBox(width: 43.sp,),
                  Text(widget.start_date+ " - "+widget.end_date,style: TextStyle(color: AppTheme.lightunclickedColor,fontSize: AppSizes.title2),),
                  Spacer(),
                  Container(

                      child: ImageIcon(AssetImage(AppImages.edit),color: AppTheme.PrimaryColor,)),

                ],
              ),
            ],
          ),
        ));
  }
}