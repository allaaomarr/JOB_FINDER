 import 'package:easy_stepper/easy_stepper.dart';
import 'package:jobfinder/Controller/Provider/saved_jobs_provider.dart';
import 'package:jobfinder/Controller/data/Network/dio.dart';
import 'package:jobfinder/styles/app_theme.dart';
import 'package:provider/provider.dart';

import '../../Controller/Provider/home_provider.dart';
import '../../utilities/app_images.dart';

class save extends StatefulWidget {
  int job_id;
  String image;
 save({required this.job_id,this.image =AppImages.save });

   @override
   State<save> createState() => _saveState();
 }
Color? color = Color(0xff111827);
bool saved = true;
 class _saveState extends State<save> {
   @override
   Widget build(BuildContext context) {
     return InkWell(
         onTap: (){
           print(widget.job_id);
        saved ==false ?  Provider.of<SavedJobsProvider>(context,listen: false).saved_job(widget.job_id):Provider.of<SavedJobsProvider>(context,listen: false).delete_job(widget.job_id) ;
setState(() {
  saved = !saved;
});
         },
         child: Image.asset(saved ? widget.image :AppImages.saved,));
   }
 }
