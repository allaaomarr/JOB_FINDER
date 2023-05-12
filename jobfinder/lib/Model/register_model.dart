class RegisterModel{

  String? name;
  String? email;
  String? password;

   RegisterModel.toJson(Map<String, dynamic> json){
    name = json['name'];
    email = json['email'];
    password = json['password'];
  }
}