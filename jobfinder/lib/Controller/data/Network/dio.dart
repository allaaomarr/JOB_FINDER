import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jobfinder/Model/education_model.dart';
import 'package:jobfinder/Model/saved_jobs_model.dart';
import 'package:jobfinder/Model/suggested_jobs_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Model/jobs_model.dart';
import '../../../Model/profile_model.dart';
import '../../../Model/search_model.dart';
import '../../../constants/end_points.dart';
ProgressCallback? onSendProgress;
ProgressCallback? onReceiveProgress;
Future<List<SuggestedJobsModel>> GetFunctionwithUserid(String url) async {
  final dio = Dio();
  Response response;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token').toString();
  int? user_id = prefs.getInt('user_id');
  try{
    response = await dio.get(
      '$url$user_id', options: Options(
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
    print("suggestedjobdata${response.data.toString()}");
    var data =  List<SuggestedJobsModel>.from(
        response.data['data'].map((element) =>
            SuggestedJobsModel.fromJson(element)));
    // print(data.runtimeType);
    print(data[1].name);
    print(data[1]);
    return data;
    // The below request is the same as above.
  }
  on DioError  catch (ex) {
    if(ex.type == DioErrorType.connectionTimeout){
      throw Exception("Connection  Timeout Exception");
    }
    throw Exception(ex.message);
  }

}
Future<List<SearchModel>> GetDataSearch(String name) async {
     final dio = Dio();
     Response response;
     SharedPreferences prefs = await SharedPreferences.getInstance();
     String? token = prefs.getString('token').toString();
     try{
     response = await dio.get(
       baseUrl+search+'$name', options: Options(
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
     print(response.data['data'].length);
     var data =  List<SearchModel>.from(
         response.data['data'].map((element) =>
             JobsModel.fromJson(element)));
     // print(data.runtimeType);
     print(data[1].name);
     print(data[1].name);
     print(data[1]);

     print(response.data.toString());
     return data;
     // The below request is the same as above.
   }
on DioError  catch (ex) {
if(ex.type == DioErrorType.connectionTimeout){
throw Exception("Connection  Timeout Exception");
}
throw Exception(ex.message);
}

   }
Future<List<SearchModel>> GetDataSearchfilter(String title,String location,String salary) async {
  final dio = Dio();
  Response response;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token').toString();
  try{
    response = await dio.get(
      baseUrl+searchfilter, options: Options(
        receiveDataWhenStatusError: true,

        receiveTimeout: Duration(seconds: 60),
        followRedirects: false,

        validateStatus: (status) => true,
        headers: {
          // "Accept": "application/json",
          'Authorization': 'Bearer ${token}',
        }
    ),
      data: {'name': title, 'location':location,'salary':salary},
    );
    print(response.data['data'].length);
    var data =  List<SearchModel>.from(
        response.data['data'].map((element) =>
            SearchModel.fromJson(element)));
    // print(data.runtimeType);
    print(data[1].name);
    print(data[1]);

    print(response.data.toString());
    return data;
    // The below request is the same as above.
  }
  on DioError  catch (ex) {
    if(ex.type == DioErrorType.connectionTimeout){
      throw Exception("Connection  Timeout Exception");
    }
    throw Exception(ex.message);
  }

}

GetdataFunction(String url) async {
  final dio = Dio();
  Response response;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token').toString();
  int? user_id = prefs.getInt('user_id');
  try {
    response = await dio.get(
      '$url', options: Options(
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
    print(response.data['data'].toString());
    print(response.data['data'].length);
    var data = List<JobsModel>.from(
        response.data['data'].map((element) =>
            JobsModel.fromJson(element)));
    // print(data.runtimeType);
    print(data[1].name);
    print(data[1]);
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
GetProfileData() async {
  final dio = Dio();
  Response response;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token').toString();
  int? user_id = prefs.getInt('user_id');
  try {
    response = await dio.get(
      baseUrl+profileinfo+'$user_id', options: Options(
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
    print('data is'+response.data['data'].toString());
    print(response.data['data'].length);
   var data =
            ProfileModel.fromJson(response.data['data']);
     print(data.runtimeType);
    print(data.name);
    print(data.work);
    print(data.details);
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
 PostDataFavorite(int job_id, ) async {
    var dio = Dio();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token').toString();
    int? user_id = prefs.getInt('user_id');
    try {
      var response = await dio.post(
       baseUrl+ 'favorites', options: Options(
        receiveDataWhenStatusError: true,

        receiveTimeout: Duration(seconds: 60),
        followRedirects: false,

        validateStatus: (status) => true,
          headers: {
            // "Accept": "application/json",
            'Authorization': 'Bearer ${token}',
          }
      ),
        data: {'user_id': user_id, 'job_id': job_id,},
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      print(response.statusCode);
      print(user_id);
      print(job_id);
      if (response.statusCode == 200) {

        print(token);
        print(user_id);
        print(job_id);
        print(response.statusCode);
        print(response.data);
      }
    } on DioError catch (ex) {
      if (ex.type == DioErrorType.connectionTimeout) {
        throw Exception("Connection  Timeout Exception");
      }
      throw Exception(ex.message);
    }

  }
putDataSetup(worktype,workfromhome,remotework) async {
  var dio = Dio();
  SharedPreferences prefs = await SharedPreferences.getInstance();
 String? token = prefs.getString('token').toString();
  int? user_id = prefs.getInt('user_id');

  print("saved tokenputdata${prefs.getString('token')}");
try
{

  print("saved tokenputdata${prefs.getString('token')}");
//  Dio().options.headers["Authorization"] = "Bearer $token";

final Response response = await dio.put(
  baseUrl+setup+'$user_id',
  options: Options(
    receiveDataWhenStatusError: true,

    receiveTimeout: Duration(seconds: 60),
    followRedirects: false,

    validateStatus: (status) => true,
      headers :{
      // "Accept": "application/json",
        'Authorization': 'Bearer ${token}',
      }
  ),
 data:  {'intersted_work': worktype,
   'offline_place': workfromhome,'remote_place':remotework},

onSendProgress: onSendProgress,
onReceiveProgress: onReceiveProgress,
);
  response.data['user_id'];

print(response.data['data']['user_id']);
  prefs.setInt('user_id',response.data['data']['user_id']);
print(response.statusCode);
print(response.data.toString());

}

on DioError  catch (ex) {
  if(ex.type == DioErrorType.connectionTimeout){
    throw Exception("Connection  Timeout Exception");
  }
  throw Exception(ex.message);
}

}
 GetSavedJobs(String url) async {
   final dio = Dio();
   Response response;
   SharedPreferences prefs = await SharedPreferences.getInstance();
   String? token = prefs.getString('token').toString();
   int? user_id = prefs.getInt('user_id');
   try {
     response = await dio.get(
       '$url$user_id', options: Options(
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
     print("favorites${response.data.toString()}");
     var data = List<SavedJobsModel>.from(
         response.data['data'].map((element) =>
             SavedJobsModel.fromJson(element)));

     print(data.runtimeType);
     print(data[1].name);
     print(data[1]);
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
 deleteSavedJobs(int favorite_id) async {
    final dio = Dio();
    Response response;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token').toString();

    try{
      response = await dio.delete(
       baseUrl+favorites+'$favorite_id', options: Options(
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
      print(response.data);


      // The below request is the same as above.
    }
    on DioError  catch (ex) {
      if(ex.type == DioErrorType.connectionTimeout){
        throw Exception("Connection  Timeout Exception");
      }
      throw Exception(ex.message);
    }

}
 GetJobDetails(
    int job_id
     ) async {
  final dio = Dio();
  Response response;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token').toString();
 print(job_id);
  try {
    response = await dio.post(
      baseUrl+getjobs+'$job_id', options: Options(
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
    print(response.data);
  //  var data = List<SavedJobsModel>.from(
        //response.data['data'].map((element) =>
         //   SavedJobsModel.fromJson(element)));
   // return data;
    // The below request is the same as above.
  }
  on DioError catch (ex) {
    if (ex.type == DioErrorType.connectionTimeout) {
      throw Exception("Connection  Timeout Exception");
    }
    throw Exception(ex.message);
  }
}
putDatalanguage(language) async {
  var dio = Dio();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token').toString();
  int? id = prefs.getInt('user_id');

  print("saved tokenputdata${prefs.getString('token')}");
  print(id);
  try
  {

    print("saved tokenputdata${prefs.getString('token')}");
//  Dio().options.headers["Authorization"] = "Bearer $token";

    final Response response = await dio.put(
      baseUrl+addlanguage+'$id',
      options: Options(
          receiveDataWhenStatusError: true,

          receiveTimeout: Duration(seconds: 60),
          followRedirects: false,

          validateStatus: (status) => true,
          headers :{
            // "Accept": "application/json",
            'Authorization': 'Bearer ${token}',
          }
      ),
      data:  {'language': language,},

      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    print(response.statusCode);
    print(response.data.toString());
    Fluttertoast.showToast(
        msg: "Saved Successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  on DioError  catch (ex) {
    if(ex.type == DioErrorType.connectionTimeout){
      throw Exception("Connection  Timeout Exception");
    }
    throw Exception(ex.message);
  }

}
PostDataPortifolio( cv_file,String name ) async {
  var dio = Dio();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token').toString();
  int? user_id = prefs.getInt('user_id');
  try {
    var response = await dio.post(
      baseUrl+postdataportfolio+'$user_id', options: Options(
        receiveDataWhenStatusError: true,

        receiveTimeout: Duration(seconds: 60),
        followRedirects: false,

        validateStatus: (status) => true,
     headers: {
        "Accept": "application/json",
     'Authorization': 'Bearer ${token}',
   }//
    ),
      data: {'cv_file': cv_file, 'name': name,},
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    print(response.statusCode);
    print(response.data);
    print(user_id);
    print(cv_file);
    print(name);
    if (response.statusCode == 200) {

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

}
puteditprofile(bio, address, mobile,
) async {
  var dio = Dio();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token').toString();
  int? id = prefs.getInt('user_id');
  int? user_id = prefs.getInt('user_id');
  print("saved tokenputdata${prefs.getString('token')}");
  print(id);
  try
  {

    print("saved tokenputdata${prefs.getString('token')}");
//  Dio().options.headers["Authorization"] = "Bearer $token";

    final Response response = await dio.put(
      baseUrl+editprofile+'$id',
      options: Options(
          receiveDataWhenStatusError: true,

          receiveTimeout: Duration(seconds: 60),
          followRedirects: false,

          validateStatus: (status) => true,
          headers :{
            // "Accept": "application/json",
            'Authorization': 'Bearer ${token}',
          }
      ),
      data:  {'bio': bio, 'address':address, 'mobile' :mobile},

      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    Fluttertoast.showToast(
        msg: "Saved Successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );
    print(bio);
    print(address);
    print(mobile);
    print(response.statusCode);
    print(response.data.toString());

  }

  on DioError  catch (ex) {
    if(ex.type == DioErrorType.connectionTimeout){
      throw Exception("Connection  Timeout Exception");
    }
    throw Exception(ex.message);
  }

}
GetChat() async {
  final dio = Dio();
  Response response;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token').toString();
  int? user_id = prefs.getInt('user_id');
  try {
    response = await dio.get(
      baseUrl+getchat, options: Options(
        receiveDataWhenStatusError: true,

        receiveTimeout: Duration(seconds: 60),
        followRedirects: false,

        validateStatus: (status) => true,
        headers: {
          // "Accept": "application/json",
          'Authorization': 'Bearer ${token}',
        }
    ),
      data: {'user_id': 1, 'comp_id': 8,},
    );
    print(response.data['data'].toString());
    print(response.data['data'].length);
    var data = List<JobsModel>.from(
        response.data['data'].map((element) =>
            JobsModel.fromJson(element)));
    // print(data.runtimeType);
    print(data[1].name);
    print(data[1]);
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
postuserChat() async {
  final dio = Dio();
  Response response;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token').toString();
  int? user_id = prefs.getInt('user_id');
  try {
    response = await dio.post(
      'http://134.209.132.80/api/chat', options: Options(
        receiveDataWhenStatusError: true,

        receiveTimeout: Duration(seconds: 60),
        followRedirects: false,

        validateStatus: (status) => true,
        headers: {
          // "Accept": "application/json",
          'Authorization': 'Bearer ${token}',
        }
    ),
      data: {'massage': "hiii",'user_id': 1, 'comp_id': 1,},
    );
    print(response.data['data'].toString());
    print(response.data['data'].length);
    var data = List<JobsModel>.from(
        response.data['data'].map((element) =>
            JobsModel.fromJson(element)));
    // print(data.runtimeType);
    print(data[1].name);
    print(data[1]);
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
/*Posteducation( universty,title,
start, end
 ) async {
  var dio = Dio();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token').toString();
  int? user_id = prefs.getInt('user_id');
  try {
    var response = await dio.post(
      'http://134.209.132.80/api/education', options: Options(
        receiveDataWhenStatusError: true,

        receiveTimeout: Duration(seconds: 60),
        followRedirects: false,

        validateStatus: (status) => true,
        headers: {
          "Accept": "application/json",
          'Authorization': 'Bearer ${token}',
        }//
    ),
      data: {'universty': universty, 'title' :title, 'start':start, 'end': end, 'id' :user_id,},
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

} */
Geteducation() async {
  final dio = Dio();
  Response response;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token').toString();
  int? user_id = prefs.getInt('user_id');
  try {
    response = await dio.get(
    baseUrl+education  +'$user_id', options: Options(
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
EditDatadetails(int job_id, ) async {
  var dio = Dio();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token').toString();
  int? user_id = prefs.getInt('user_id');
  try {
    var response = await dio.post(
      baseUrl+ 'favorites', options: Options(
        receiveDataWhenStatusError: true,

        receiveTimeout: Duration(seconds: 60),
        followRedirects: false,

        validateStatus: (status) => true,
        headers: {
          // "Accept": "application/json",
          'Authorization': 'Bearer ${token}',
        }
    ),
      data: {'user_id': user_id, 'job_id': job_id,},
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    print(response.statusCode);
    print(user_id);
    print(job_id);
    if (response.statusCode == 200) {

      print(token);
      print(user_id);
      print(job_id);
      print(response.statusCode);
      print(response.data);
    }
  } on DioError catch (ex) {
    if (ex.type == DioErrorType.connectionTimeout) {
      throw Exception("Connection  Timeout Exception");
    }
    throw Exception(ex.message);
  }

}