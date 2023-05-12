import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jobfinder/Model/education_model.dart';
import 'package:jobfinder/Model/experience_model.dart';
import 'package:jobfinder/constants/end_points.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/Network/dio.dart';


class CompleteProfileProvider extends ChangeNotifier {
   List<EducationModel> savededucation = [];
  List<ExperienceModel>  savedexperience =[];

  Posteducation(universty, title, start, end) async {
    var dio = Dio();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token').toString();
    int? user_id = prefs.getInt('user_id');
    try {
      var response = await dio.post(
        baseUrl+'education', options: Options(
          receiveDataWhenStatusError: true,

          receiveTimeout: Duration(seconds: 60),
          followRedirects: false,

          validateStatus: (status) => true,
          headers: {
            "Accept": "application/json",
            'Authorization': 'Bearer ${token}',
          } //
      ),
        data: {
          'universty': universty,
          'title': title,
          'start': start,
          'end': end,
          'user_id': user_id,
        },
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      print(response.statusCode);
      print(response.data);
      print(user_id);
      print(token);

      if (response.statusCode == 200) {
        Fluttertoast.showToast(
            msg: "Saved Successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0
        );
        print(token);
        print(response.statusCode);
        print(response.data);
      }
    } on DioError catch (ex) {
      if (ex.type == DioErrorType.connectionTimeout) {
        throw Exception("Connection  Timeout Exception");
      }
      throw Exception(ex.message);
    }


    notifyListeners();
  }
  Geteducation() async {
   var dio = Dio();
    Response response;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token').toString();
    int? user_id = prefs.getInt('user_id');
    try {
      response = await dio.get(
          baseUrl+education+'$user_id', options: Options(
          receiveDataWhenStatusError: true,

          receiveTimeout: Duration(seconds: 60),
          followRedirects: false,

          validateStatus: (status) => true,
          headers: {
            // "Accept": "application/json",
            'Authorization': 'Bearer ${token}',
          }
      ),
      );
      var data = List<EducationModel>.from(
          response.data['data'].map((element) =>
              EducationModel.fromJson(element)));

      print(data.runtimeType);
      print(data[1].title);
      print(data[1].university);
      print(data[1].start_date);
      print(data[1].end_date);

      notifyListeners();
      return data;

      // The below request is the same as above.
    }
    on DioError catch (ex) {
      if (ex.type == DioErrorType.connectionTimeout) {
        throw Exception("Connection  Timeout Exception");
      }
      throw Exception(ex.message);
    }

  }
  getalleducation(){
  Geteducation().then((value) {
   savededucation = value;
    notifyListeners();


  });
  notifyListeners();
}
  Postexperience(
  postion,
  type_work,
  comp_name,
  location,
  start) async {
    var dio = Dio();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token').toString();
    int? user_id = prefs.getInt('user_id');
    try {
      var response = await dio.post(
       baseUrl+'experince', options: Options(
          receiveDataWhenStatusError: true,

          receiveTimeout: Duration(seconds: 60),
          followRedirects: false,

          validateStatus: (status) => true,
          headers: {
            "Accept": "application/json",
            'Authorization': 'Bearer ${token}',
          } //
      ),
        data: {
          'user_id':user_id,
          'postion' : postion,
         'type_work': type_work,
          'comp_name': comp_name,
          'location' : location,
          'start' :start,
        },
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      print(response.statusCode);
      print(response.data);
      print(user_id);
      print(token);

      if (response.statusCode == 200) {
        Fluttertoast.showToast(
            msg: "Saved Successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0
        );
        print(token);
        print(response.statusCode);
        print(response.data);
        var data = List<ExperienceModel>.from(
            response.data['data'].map((element) =>
                ExperienceModel.fromJson(element)));
        print(data[0]);
        return data;

      }
    } on DioError catch (ex) {
      if (ex.type == DioErrorType.connectionTimeout) {
        throw Exception("Connection  Timeout Exception");
      }
      throw Exception(ex.message);
    }


    notifyListeners();
  }
  Getexperience() async {
    var dio = Dio();
    Response response;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token').toString();
    int? user_id = prefs.getInt('user_id');
    try {
      response = await dio.get(
        baseUrl+experience+'$user_id', options: Options(
          receiveDataWhenStatusError: true,

          receiveTimeout: Duration(seconds: 60),
          followRedirects: false,

          validateStatus: (status) => true,
          headers: {
            // "Accept": "application/json",
            'Authorization': 'Bearer ${token}',
          }
      ),
      );
      var data = List<ExperienceModel>.from(
          response.data['data'].map((element) =>
              ExperienceModel.fromJson(element)));

      print(data.runtimeType);


      notifyListeners();
      return data;

      // The below request is the same as above.
    }
    on DioError catch (ex) {
      if (ex.type == DioErrorType.connectionTimeout) {
        throw Exception("Connection  Timeout Exception");
      }
      throw Exception(ex.message);
    }

  }
  getallexperience(){
    Getexperience().then((value) {
      savedexperience = value;
      notifyListeners();


    });
    notifyListeners();
  }
}