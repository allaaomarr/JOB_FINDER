import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobfinder/Model/suggested_jobs_model.dart';
import 'package:jobfinder/constants/end_points.dart';

import '../../Model/jobs_model.dart';
import '../data/Network/dio.dart';

class HomeProvider extends ChangeNotifier {
  bool isLoading = false;
  late List<JobsModel> alljobs = [];
  late List<SuggestedJobsModel> suggestjobs = [];
Getjobs() async {
await  GetdataFunction(baseUrl+'jobs').then((value) {
    alljobs = value;
print(alljobs);
    notifyListeners();


  });
  notifyListeners();
  isLoading = false;
  notifyListeners();
}

 Getsuggestedjobs(){
    GetFunctionwithUserid(baseUrl+suggestedjobs).then((value) {
  suggestjobs = value;
print(suggestjobs);
      notifyListeners();


    });
    notifyListeners();
  }

}