

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:jobfinder/Controller/data/Network/dio.dart';
import 'package:jobfinder/Model/register_model.dart';
import 'package:jobfinder/View/register_pages/type_of_work.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../View/home_search/home_page.dart';
import '../../constants/end_points.dart';
class RegisterProvider extends ChangeNotifier{
 late RegisterModel register ;

  Registeration(name,email,password,context) async{

    var dio = Dio();
    try {
     var response = await dio.post(
       baseUrl + registerEndPoint, options: Options(
      receiveDataWhenStatusError: true,

      receiveTimeout: Duration(seconds: 60),
      followRedirects: false,
      validateStatus: (status) => true,

     ),
 data: {'name': name, 'email': email, 'password': password,},
    //   data: data,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
     );
     if(response.statusCode == 200) {

       String token = response.data['token'];
       int userid = response.data['profile']['user_id'];
       int id = response.data['profile']['id'];
       String name = response.data['profile']['name'];
       SharedPreferences prefs = await SharedPreferences.getInstance();
       prefs.setInt('user_id',userid);
       prefs.setInt('id',id);
       prefs.setString('token', token);
       prefs.setString('name', name);
       print(token);
       print(userid);
      print(response.statusCode);
      print(response.data);
       notifyListeners();
      Fluttertoast.showToast(
          msg: "Successfully registered",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0

      );
       Navigator.pushReplacement(context,
           MaterialPageRoute(
             builder: (context) => type_of_work(),));
       notifyListeners();
     }
else {
       Fluttertoast.showToast(
           msg: "Registration Failed Try Another Email and Password",
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
     Fluttertoast.showToast(
         msg: Exception(ex.message).toString(),
         toastLength: Toast.LENGTH_SHORT,
         gravity: ToastGravity.CENTER,
         timeInSecForIosWeb: 1,
         backgroundColor: Colors.red,
         textColor: Colors.white,
         fontSize: 16.0
     );

     throw Exception(ex.message);

    }
    notifyListeners();
   }




Registerationdatasetup(worktype, workfromhome, remotework){
 putDataSetup(worktype, workfromhome, remotework);
 notifyListeners();
}

}