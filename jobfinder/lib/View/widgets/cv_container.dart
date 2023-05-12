import 'package:easy_stepper/easy_stepper.dart';
import 'package:jobfinder/utilities/app_images.dart';

import '../../styles/app_theme.dart';
import 'headers.dart';

class cv_container extends StatefulWidget {
  String filename ;
  String filesize;
  cv_container({required this.filename , this.filesize = "CV.pdf 300KB"});

  @override
  State<cv_container> createState() => _cv_containerState();
}

class _cv_containerState extends State<cv_container> {
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
    padding: const EdgeInsets.all(20),
    child: Row(

    children: [
      Image.asset(AppImages.pdf),
      SizedBox(width: 10,),
    headers(header1: widget.filename, header2: widget.filesize,sizedbox: 5,align: CrossAxisAlignment.start,align2: AlignmentDirectional.topStart,header1size: 13,haeder2size: 11,sizedbox2: 0,),
    Spacer(),
    ImageIcon(AssetImage(AppImages.edit),color: AppTheme.PrimaryColor,),
      SizedBox(width: 5,),
      Icon(Icons.cancel_outlined,color: Colors.red,),

    /*    Container(
                              //  height: 70,
                              //  width: 50,
  child:   IconButton(onPressed: (){



  }, icon: Icon(Icons.radio_button_off)),
)*/
    ],
    ),
    ));
  }
}
/// TODO ADD CV REMOVE IT EDIT  SQLFLITE, SHAREDPREFERNCES