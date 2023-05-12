class RegisterModel{


  String? email;
  String? password;

  RegisterModel.toJson(Map<String, dynamic> json){

    email = json['email'];
    password = json['password'];
  }
}