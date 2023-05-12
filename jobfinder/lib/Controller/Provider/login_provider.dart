import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:jobfinder/Controller/data/Network/dio.dart';
import 'package:jobfinder/Model/register_model.dart';
import 'package:jobfinder/constants/end_points.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../View/home_search/home_page.dart';
class LoginProvider extends ChangeNotifier {
//  late LoginModel register;
bool state = false;
var status;
  PostDatalogin(email, password,context) async {
    var dio = Dio();
    try {
      var response = await dio.post(
        baseUrl + loginEndPoint, options: Options(
        receiveDataWhenStatusError: true,

        receiveTimeout: Duration(seconds: 60),
        followRedirects: false,

        validateStatus: (status) => true,

      ),
        data: {'email': email, 'password': password,},
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        notifyListeners();
        print(response.data);
        String token = response.data['token'];
        print(token);
        int userid = response.data['user']['id'];
        String name = response.data['user']['name'];
        SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.setInt('user_id',userid);
        prefs.setString('token', token);
        prefs.setString('name', name);
 status = response.data['status'];
        notifyListeners();
        print(status);
        print(token);
       print(userid);
        print(response.statusCode);
        print(response.data);
        Navigator.pushReplacement(context,
            MaterialPageRoute(
              builder: (context) => home_page(),));
        notifyListeners();
      }
      else {
        Fluttertoast.showToast(
            msg: "Login Failed Try Another Email and Password",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }

    } on DioError catch (ex) {
      if (ex.type == DioErrorType.connectionTimeout) {
        throw Exception("Connection  Timeout Exception");
      }
      state= false;
      notifyListeners();
      print(state);

      throw Exception(ex.message);

    }
    notifyListeners();
  }
}