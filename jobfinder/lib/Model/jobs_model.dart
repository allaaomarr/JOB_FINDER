class JobsModel {
  int jobid;
  String? name;
  String? location;
  String? comp_name;
 // filters
 String? job_time_type;
  String? job_type;
  String? job_level;
  String? salary;

  JobsModel({required this.jobid ,this.name,  this.location,
  this.comp_name,
  this.job_time_type,
  this.job_type,
  this.job_level,
  this.salary,
  });
  factory JobsModel.fromJson(Map<String, dynamic> data){
    return JobsModel(
      jobid: data['id'],
    name:data['name'],
    location: data['location'],
    comp_name: data['comp_name'],

     job_time_type:data['job_time_type'],
    job_type:data['job_type'],
     job_level:data['job_level'],
     salary:data['salary'],
    );

  }

}
/*
 {status: true, data: [{id: 8, name: fulstack Amit, image: null,
  job_time_type: fulltime, job_type: onsite, job_level: senior, job_description: dsjdhsdjhdjshddj,
   job_skill: php and laravel and css and bootstrap, comp_name: Amit, comp_email: amit@gmail.com, comp_website: amit.com, about_comp: programing company, location: cairo - maadi - elsalam, salary: 10k-16k, favorites: 0, expired: 0, created_at: 2023-03-18T14:42:56.000000Z, updated_at: 2023-03-18T14:42:56.000000Z}, {id: 7, name: flutter Amit, image: null, job_time_type: parttime, job_type: remotely, job_level: mid senior, job_description: dsjdhsdjhdjshddj, job_skill: flutter and dart and dio, comp_name: Amit, comp_email: amit@gmail.com, comp_website: amit.com, about_comp: programing company, location: cairo - maadi - elsalam, salary: 10k-16k, favorites: 0, expired: 0, created_at: 2023-03-18T14:39:23.000000Z, updated_at: 2023-03-18T14:39:23.000000Z}, {id: 6, name: amit, image: null, job_time_type: part, job_type: jsjgds, job_level: entry, job_description:
 */