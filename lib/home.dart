import 'package:flutter/material.dart';
import 'package:rusume_builder/components/personal_field.dart';
import 'package:rusume_builder/constants/colors.dart';
import 'package:rusume_builder/generate_resume/resume_output_page.dart';
import 'package:rusume_builder/local_db/personal_details.dart';
import 'package:rusume_builder/local_db/resume_localdb.dart';
import 'package:rusume_builder/widgets/custom_appbar_this_project.dart';
import 'package:rusume_builder/widgets/custom_button_final.dart';
import 'package:rusume_builder/widgets/custom_textform_thisproject.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final addressController = TextEditingController();
  final aboutController = TextEditingController();
  final urlController = TextEditingController();
  final skillController = TextEditingController();
  final eduController = TextEditingController();
  final langController = TextEditingController();
  final hobbController = TextEditingController();
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    aboutController.text = resumeLocalDb.resumeAbout;
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('details :\n'
        'name ${resumeLocalDb.resumeName}\n'
        "mobile : ${resumeLocalDb.resumeMobile}\n"
        "email : ${resumeLocalDb.resumeEmail}\n"
        "url : ${resumeLocalDb.resumeUrl}\n"
        "about : ${resumeLocalDb.resumeAbout}\n");
    return Scaffold(
      backgroundColor: ResumeConstColor.resumeBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBarThisProject(
          appbarTitle: 'Resume Builder Project',
          textStyle: ResumeCustomTextStyle.poppins(
            fontSize: MediaQuery.of(context).size.width * 0.055,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: customPaddingThisproject,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          child: Form(
            key: formKey,
            child: Column(children: [
              PersonalField(
                  nameController: nameController,
                  emailController: emailController,
                  mobileController: mobileController,
                  addressController: addressController,
                  skillController: skillController,
                  urlController: urlController,
                  eduController: eduController,
                  langController: langController,
                  hobbiesController: hobbController,),
              SizedBox(
                height: 20,
              ),
              CustomTextformThisProject(
                controller: aboutController,
                validator: (about) {
                  if (about == null || about.trim().isEmpty) {
                    return 'Please discribe your self';
                  } else {
                    return null;
                  }
                },
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 15,
                ),
                fieldHeight: 250,
                textAlign: TextAlign.justify,
                maxLength: 500,
                maxLines: 8,
                lable: 'Describe yourself',
                hintText: 'Please write your objective',
              ),
              CustomButtonResumeBuild(onTap: () {
                if (formKey.currentState!.validate()) {
                  personalDetailSection(
                    about: aboutController.text,
                    mobile: mobileController.text,
                    address: addressController.text,
                    email: emailController.text,
                    name: nameController.text,
                    url: urlController.text,
                    skills: skillController.text,
                    hobbies: hobbController.text,
                    edu: eduController.text,
                    lang: langController.text,
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GetResume()),
                  );
                }
              })
            ]),
          ),
        ),
      ),
    );
  }
}
