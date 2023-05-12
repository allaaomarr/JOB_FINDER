class EducationModel {

  String university;
  String title;
  String start_date;
  // filters
  String end_date;


  EducationModel({
   required this.university,
   required this.title,
   required this.start_date,
    // filters
   required this.end_date,
  });
  factory EducationModel.fromJson(Map<String, dynamic> data){
    return EducationModel(
university: data['universty'],
        title: data['title'],
        start_date : data['start'],
        end_date:data['end'],
    );

  }

}
