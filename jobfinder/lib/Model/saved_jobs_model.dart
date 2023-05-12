class SavedJobsModel {
  int favid;
  String? name;
  String? location;
  String? comp_name;
  // filters
  String? job_time_type;
  String? job_type;
  String? job_level;
  String? salary;

  SavedJobsModel({required this.favid ,this.name,  this.location,
   // this.comp_name,
   // this.job_time_type,
   // this.job_type,
   // this.job_level,
   // this.salary,
  });
  factory SavedJobsModel.fromJson(Map<String, dynamic> data){
    return SavedJobsModel(
      favid: data['id'],
      name:data['name'],
      location: data['location'],
    //  comp_name: data['comp_name'],

    //  job_time_type:data['job_time_type'],
    //  job_type:data['job_type'],
    ////  job_level:data['job_level'],
    //  salary:data['salary'],
    );

  }

}