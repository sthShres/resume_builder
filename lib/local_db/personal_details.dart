import 'resume_localdb.dart';

void personalDetailSection(

  {
    required String name,
    required String email,
    required String mobile,
    required String address,
    required String url,
    required String about,
    required String skills,
    required String edu,
    required String lang,
    required String hobbies,
    
    
  }
){
resumeLocalDb.resumeName = name;
resumeLocalDb.resumeEmail = email;
resumeLocalDb.resumeMobile = mobile;
resumeLocalDb.resumeAddress = address;
resumeLocalDb.resumeUrl = url;
resumeLocalDb.resumeAbout = about;
resumeLocalDb.resumeSkills = skills;
resumeLocalDb.resumeEducation = edu;
resumeLocalDb.resumeLanguage = lang;
resumeLocalDb.resumeHobbies = hobbies;

}