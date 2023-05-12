import 'package:easy_stepper/easy_stepper.dart';
import 'package:sizer/sizer.dart';

import '../../utilities/app_images.dart';

class arrowback_title extends StatefulWidget {
  String title ;
 arrowback_title({required this.title});

  @override
  State<arrowback_title> createState() => _arrowback_titleState();
}

class _arrowback_titleState extends State<arrowback_title> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.fromLTRB(15,15,15,10),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: ImageIcon(
                AssetImage(AppImages.arrowback),
              )),
          Spacer(),
          Container(
            alignment: AlignmentDirectional.center,
            child: Text(widget.title,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              ),textAlign: TextAlign.center,),
          ),
          Spacer(),
          Container(
            width:30.sp ,
            child: Text("", textAlign: TextAlign.center,),
          )
        ],
      ),
    );
  }
}
