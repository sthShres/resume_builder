import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/string.dart';

class ResumeSharedPrefrences {
  SharedPreferences? _localDb;

  init() async {
    _localDb = await SharedPreferences.getInstance();
  }

  //setter

  set resumeName(String value) {
    _localDb?.setString(StringConstants.nameConst, value);
  }

  set resumeEmail(String value) {
    _localDb?.setString(StringConstants.emailConst, value);
  }

  set resumeMobile(String value) {
    _localDb?.setString(StringConstants.mobileConst, value);
  }

  set resumeAddress(String value) {
    _localDb?.setString(StringConstants.addressConst, value);
  }

  set resumeUrl(String value) {
    _localDb?.setString(StringConstants.urlConst, value);
  }

  set resumeAbout(String value) {
    _localDb?.setString(StringConstants.aboutConst, value);
  }

  set resumePhoto(String value) {
    _localDb?.setString(StringConstants.uploadphotoConst, value);
  }

  set resumeSkills(String value) {
    _localDb?.setString(StringConstants.skillsConst, value);
  }
   set resumeEducation(String value) {
    _localDb?.setString(StringConstants.eduConst, value);
  }
   set resumeLanguage(String value) {
    _localDb?.setString(StringConstants.langConst, value);
  }
   set resumeHobbies(String value) {
    _localDb?.setString(StringConstants.hobbiesConst, value);
  }

  //getter
  String get resumeName => _localDb?.getString(StringConstants.nameConst) ?? '';

  String get resumeEmail =>
      _localDb?.getString(StringConstants.emailConst) ?? '';

  String get resumeMobile =>
      _localDb?.getString(StringConstants.mobileConst) ?? '';

  String get resumeAddress =>
      _localDb?.getString(StringConstants.addressConst) ?? '';

  String get resumeUrl => _localDb?.getString(StringConstants.urlConst) ?? '';

  String get resumeAbout =>
      _localDb?.getString(StringConstants.aboutConst) ?? '';

  String get resumePhoto =>
      _localDb?.getString(StringConstants.uploadphotoConst) ?? '';

  String get resumeSkills =>
      _localDb?.getString(StringConstants.skillsConst) ?? '';

  String get resumeEducation =>
      _localDb?.getString(StringConstants.eduConst) ?? '';

   String get resumeLanguage =>
      _localDb?.getString(StringConstants.langConst) ?? '';
   String get resumeHobbies =>
      _localDb?.getString(StringConstants.hobbiesConst) ?? '';

  //delete all function
  Future<bool> deleteAllRecord() async {
    bool x = await _localDb!.clear();
    log('x : $x');
    return x;
  }
}

final resumeLocalDb = ResumeSharedPrefrences();
