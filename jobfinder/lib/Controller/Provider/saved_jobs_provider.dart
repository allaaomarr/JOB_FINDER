import 'package:flutter/cupertino.dart';
import 'package:jobfinder/Controller/data/Network/dio.dart';
import 'package:jobfinder/constants/end_points.dart';
import '../../Model/saved_jobs_model.dart';
class SavedJobsProvider extends ChangeNotifier{
  String? value;

  List<SavedJobsModel> savedjobs = [];
  saved_job(int jobid){
    PostDataFavorite(jobid);
    notifyListeners();
  }
save_job()
{
  GetSavedJobs(baseUrl+favorites).then((value) {
    savedjobs = value;
    notifyListeners();

  });
  notifyListeners();
}
delete_job(int favid){
  deleteSavedJobs(favid);
  notifyListeners();
}

}
