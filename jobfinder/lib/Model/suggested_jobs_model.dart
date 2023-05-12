class SuggestedJobsModel {
  int jobid;
  String? name;
  String? location;
  String? comp_name;
  // filters
  String? job_time_type;
  String? job_type;
  String? job_level;
  String? salary;
  String? image;
  SuggestedJobsModel({
    required this.jobid,
    this.name,  this.location,
    this.comp_name,
    this.job_time_type,
    this.job_type,
    this.job_level,
    this.salary,
    this.image,
  });
  factory SuggestedJobsModel.fromJson(Map<String, dynamic> data){
    return SuggestedJobsModel(
      jobid: data['id'],
      name:data['name'],
      location: data['location'],
      comp_name: data['comp_name'],

      job_time_type:data['job_time_type'],
      job_type:data['job_type'],
      job_level:data['job_level'],
      salary:data['salary'],
      image: data['image']
    );

  }

}