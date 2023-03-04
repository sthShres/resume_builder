import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rusume_builder/constants/colors.dart';
import 'package:rusume_builder/local_db/resume_localdb.dart';
import 'package:rusume_builder/widgets/custom_button_final.dart';

import '../widgets/custom_textform_thisproject.dart';

class PersonalField extends StatefulWidget {
  final TextEditingController nameController,
      emailController,
      mobileController,
      addressController,
      skillController,
      eduController,
      hobbiesController,
      langController,
      urlController;
  const PersonalField({
    Key? key,
    required this.nameController,
    required this.emailController,
    required this.mobileController,
    required this.addressController,
    required this.urlController,
    required this.skillController, required this.eduController, required this.hobbiesController, required this.langController,
  }) : super(key: key);

  @override
  State<PersonalField> createState() => _PersonalFieldState();
}

class _PersonalFieldState extends State<PersonalField> {
  @override
  void initState() {
    super.initState();
    widget.nameController.text = resumeLocalDb.resumeName;
    widget.emailController.text = resumeLocalDb.resumeEmail;
    widget.mobileController.text = resumeLocalDb.resumeMobile;
    widget.addressController.text = resumeLocalDb.resumeAddress;
    widget.urlController.text = resumeLocalDb.resumeUrl;
    widget.skillController.text = resumeLocalDb.resumeSkills;
    widget.langController.text =  resumeLocalDb.resumeLanguage;
    widget.eduController.text = resumeLocalDb.resumeEducation;
    widget.hobbiesController.text = resumeLocalDb.resumeHobbies;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomTextformThisProject(
          controller: widget.nameController,
          contentPadding: const EdgeInsets.symmetric(horizontal: 7),
          validator: (String? name) {
            if (name == null || name.trim().isEmpty) {
              return 'Please enter name';
            } else {
              return null;
            }
          },
          prefixIcon: const Icon(
            CupertinoIcons.person,
            color: ResumeConstColor.primary,
          ),
          lable: 'Enter your name',
          hintText: 'shrestha sahil',
        ),
        CustomTextformThisProject(
          controller: widget.emailController,
          contentPadding: const EdgeInsets.symmetric(horizontal: 7),
          validator: (email) {
            String pattern =
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

            RegExp regExp = RegExp(pattern);

            if (email == null || email.trim().isEmpty) {
              return 'Enter email address';
            } else if (!regExp.hasMatch(email.replaceAll(' ', ''))) {
              return 'Enter valid email';
            } else {
              return null;
            }
          },
          prefixIcon: const Icon(
            CupertinoIcons.mail,
            color: ResumeConstColor.primary,
          ),
          lable: 'Enter your email',
          hintText: 'sthshres@gmail.com',
        ),
        CustomTextformThisProject(
          controller: widget.mobileController,
          contentPadding: const EdgeInsets.symmetric(horizontal: 7),
          keyboardType: TextInputType.phone,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          ],
          maxLength: 10,
          validator: (mobile) {
            RegExp regExp = RegExp(r'[0-9]');
            if (mobile == null || mobile.trim().isEmpty) {
              return 'please enter mobile number';
            } else if (!regExp.hasMatch(mobile) || mobile.length != 10) {
              return 'Please enter valid mobile number';
            } else {
              return null;
            }
          },
          prefixIcon: const Icon(
            CupertinoIcons.phone,
            color: ResumeConstColor.primary,
          ),
          lable: 'Enter your mobile number',
          hintText: '1234567890',
        ),
        CustomTextformThisProject(
          controller: widget.addressController,
          contentPadding: const EdgeInsets.symmetric(horizontal: 7),
          validator: (address) {
            if (address == null || address.trim().isEmpty) {
              return 'Please enter address';
            }
            return null;
          },
          prefixIcon: const Icon(
            CupertinoIcons.location,
            color: ResumeConstColor.primary,
          ),
          lable: 'Enter your address',
          hintText: 'India Jabalpur',
        ),
        CustomTextformThisProject(
          validator: (linked) {
            if (linked == null || linked.trim().isEmpty) {
              return 'Please enter address';
            }
            return null;
          },
          controller: widget.urlController,
          contentPadding: const EdgeInsets.symmetric(horizontal: 7),
          prefixIcon: const Icon(
            CupertinoIcons.link,
            color: ResumeConstColor.primary,
          ),
          lable: 'Enter LinkedIn',
          hintText: 'http://suryavanshi.io/',
        ),
        CustomTextformThisProject(
          controller: widget.skillController,
          contentPadding: const EdgeInsets.symmetric(horizontal: 7),
          prefixIcon: const Icon(
            Icons.computer,
            color: ResumeConstColor.primary,
          ),
          lable: 'Enter Your Skills',
          hintText: 'C++, C, Java, Python',
        ),
        CustomTextformThisProject(
          controller: widget.eduController,
          contentPadding: const EdgeInsets.symmetric(horizontal: 7),
          prefixIcon: const Icon(
            Icons.computer,
            color: ResumeConstColor.primary,
          ),
          lable: 'Enter Education Bakgroound',
          hintText: 'IT Engineering, Civil etc',
        ),
        CustomTextformThisProject(
          controller: widget.langController,
          contentPadding: const EdgeInsets.symmetric(horizontal: 7),
          prefixIcon: const Icon(
            Icons.computer,
            color: ResumeConstColor.primary,
          ),
          lable: 'Enter Languages You speak',
          hintText: 'Hindi, English, etc',
        ),
        CustomTextformThisProject(
          controller: widget.hobbiesController,
          contentPadding: const EdgeInsets.symmetric(horizontal: 7),
          prefixIcon: const Icon(
            Icons.computer,
            color: ResumeConstColor.primary,
          ),
          lable: 'Enter Your Hobbies',
          hintText: 'Reading Books, Swimming etc.',
        ),
      ],
    );
  }
}
