import 'package:flutter/cupertino.dart';
import 'package:jobfinder/Controller/data/Network/dio.dart';
import 'package:jobfinder/constants/end_points.dart';
import '../../Model/profile_model.dart';
import '../../Model/saved_jobs_model.dart';
class ProfileProvider extends ChangeNotifier{

  bool isLoading = false;
  late ProfileModel profiledata ;
  showprofile(){
    isLoading = false;
    GetProfileData().then((value) {
      profiledata = value;
      notifyListeners();

    });
    isLoading = false;
    notifyListeners();
  }

}