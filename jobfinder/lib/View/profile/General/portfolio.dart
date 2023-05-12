import 'package:easy_stepper/easy_stepper.dart';
import 'package:jobfinder/View/widgets/arrowback_title.dart';
import 'package:jobfinder/View/widgets/cv_container.dart';
import 'package:jobfinder/View/widgets/upload_file_widget.dart';
import 'package:jobfinder/utilities/app_strings.dart';
import 'package:sizer/sizer.dart';

class portfolio extends StatefulWidget {
  const portfolio({Key? key}) : super(key: key);

  @override
  State<portfolio> createState() => _portfolioState();
}

class _portfolioState extends State<portfolio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              arrowback_title(title:AppStrings.Portfolio),
          SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      alignment: AlignmentDirectional.topStart,
                        child: Text(AppStrings.addportfoliotitle,style: TextStyle(fontSize: 15.sp,fontWeight:FontWeight.w500),textAlign: TextAlign.start,)),


              SizedBox(height: 20,),
              upload_file_widget(),
              SizedBox(height: 20,),
              cv_container(filename: "UI/UX Designer"),
              SizedBox(height: 10,),
              cv_container(filename: "3D Designer"),
              SizedBox(height: 10,),
              cv_container(filename: "Graphic Designer"),
            ],
          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}