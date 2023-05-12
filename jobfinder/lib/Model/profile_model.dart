class ProfileModel{


  String name;
  String? details;
 String? work;
  ProfileModel({
  required this.name ,
   this.details,
   this.work ,}
  );
 factory ProfileModel.fromJson(Map<String, dynamic> json){
    return ProfileModel(
   name : json['name'],
   details : json['personal_detailes'],
  work : json['bio'],
  );
  }
}