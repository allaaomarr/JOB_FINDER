import 'package:easy_stepper/easy_stepper.dart';
import 'package:sizer/sizer.dart';
import '../../styles/app_theme.dart';

class notification_messages_conatiner extends StatefulWidget {
  String header1;
  String header2;
  double? header1size;
  double? haeder2size;
  Color? color;
  double? sizedbox;
  double? sizedbox2;
  CrossAxisAlignment align ;
  AlignmentDirectional align2;
  String? time;
 notification_messages_conatiner({required this.header1,required this.header2,this.header1size =23,this.haeder2size =13.5,this.color= Colors.black,this.sizedbox =10,this.align= CrossAxisAlignment.center,this.align2 =AlignmentDirectional.topStart,this.sizedbox2=20, this.time});

  @override
  State<notification_messages_conatiner> createState() => _notification_messages_conatinerState();
}

class _notification_messages_conatinerState extends State<notification_messages_conatiner> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: widget.align,
      children: [
        Container(
          width: 200.sp,
            alignment: widget.align2,
            child: Row(
              children: [

                Text(widget.header1,style: TextStyle(fontSize:widget.header1size?.sp ,fontWeight: FontWeight.w500,color: widget.color ),),
              Spacer(),
            //  SizedBox(width: 50.sp,),
                Text("10.00AM",style: TextStyle(color: AppTheme.unclickedColor),textAlign: TextAlign.right,),
              ],
            )),
        SizedBox(height: widget.sizedbox?.sp,),
        Container(
            alignment: widget.align2,
            child: Text(widget.header2,style: TextStyle(fontSize: widget.haeder2size?.sp,color: AppTheme.unclickedColor,fontWeight: FontWeight.w400),)),
        SizedBox(height: widget.sizedbox2?.sp,),


      ],
    );
  }
}
