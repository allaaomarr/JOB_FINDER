class ExperienceModel {

 String postion;
 String type_work;
 String comp_name;

 int start;


  ExperienceModel({
    required this.postion,
    required this.type_work,
    required this.comp_name,
    required this.start,
  });
  factory ExperienceModel.fromJson(Map<String, dynamic> data){
    return ExperienceModel(
     postion: data[' postion'],
     type_work: data['type_work'],
     comp_name: data['comp_name'],
     start: data[' start'],

    );

  }

}