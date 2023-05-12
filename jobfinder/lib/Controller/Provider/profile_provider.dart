import 'package:flutter/cupertino.dart';
import 'package:jobfinder/Controller/data/Network/dio.dart';
import 'package:jobfinder/constants/end_points.dart';
import '../../Model/profile_model.dart';
import '../../Model/saved_jobs_model.dart';
class ProfileProvider extends ChangeNotifier{


  late ProfileModel profiledata ;
  showprofile(){
    GetProfileData().then((value) {
      profiledata = value;
      notifyListeners();

    });
    notifyListeners();
  }

}