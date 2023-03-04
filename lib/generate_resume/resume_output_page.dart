import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rusume_builder/generate_resume/pdf_doc.dart';
import 'package:rusume_builder/generate_resume/widgets_for_pdf/dialog_for_delete.dart';
import 'package:rusume_builder/generate_resume/widgets_for_pdf/divider.dart';
import 'package:rusume_builder/generate_resume/widgets_for_pdf/resume_toast.dart';
import 'package:rusume_builder/local_db/resume_localdb.dart';
import 'package:rusume_builder/widgets/custom_appbar_this_project.dart';
import 'package:rusume_builder/widgets/custom_button_two.dart';
import 'package:rusume_builder/widgets/generate_pdf_button.dart';
import 'package:screenshot/screenshot.dart';
import '../constants/colors.dart';

class GetResume extends StatefulWidget {
  const GetResume({Key? key}) : super(key: key);

  @override
  State<GetResume> createState() => _GetResumeState();
}

class _GetResumeState extends State<GetResume> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScreenshotController _screenshotController = ScreenshotController();
  bool isShowLoading = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBarThisProject(
          appbarTitle: 'Collect Your Resume',
          textStyle: ResumeCustomTextStyle.poppins(
            fontSize: MediaQuery.of(context).size.width * 0.055,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Screenshot(
                controller: _screenshotController,
                child: ColoredBox(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          top: 15,
                          bottom: 12,
                        ),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(1.5),
                        width: size.width,
                        color: Colors.grey.withOpacity(0.08),
                        child: Text(
                          "Your Name: " +
                              resumeLocalDb.resumeName.toUpperCase(),
                          style: ResumeCustomTextStyle.poppins(
                            fontSize: size.width * 0.06,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.phone,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(resumeLocalDb.resumeMobile)
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.email,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(resumeLocalDb.resumeEmail)
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Icon(
                                    CupertinoIcons.location_solid,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(resumeLocalDb.resumeAddress)
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Icon(CupertinoIcons.link_circle_fill),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(resumeLocalDb.resumeUrl)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const ResumeBuildDivider(),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                        child: RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(children: <InlineSpan>[
                              TextSpan(
                                  text: 'Objective :',
                                  style: ResumeCustomTextStyle.poppins(
                                      color: ResumeConstColor.headLineColor,
                                      fontSize: size.width * 0.050,
                                      fontWeight: FontWeight.bold),
                                  children: <InlineSpan>[
                                    TextSpan(
                                        text: ' ' +
                                            resumeLocalDb.resumeAbout
                                                .toUpperCase(),
                                        style: ResumeCustomTextStyle.poppins(
                                            color: Colors.black,
                                            fontSize: size.width * 0.035,
                                            fontWeight: FontWeight.w500))
                                  ]),
                            ])),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Skills >>",
                              style: ResumeCustomTextStyle.poppins(
                                  color: ResumeConstColor.headLineColor,
                                  fontSize: size.width * 0.050,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(resumeLocalDb.resumeSkills.toUpperCase(),
                                style: ResumeCustomTextStyle.poppins(
                                    color: Colors.black,
                                    fontSize: size.width * 0.040,
                                    fontWeight: FontWeight.w500))
                          ],
                        ),
                      ),
                      const ResumeBuildDivider(),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Education Background >>",
                              style: ResumeCustomTextStyle.poppins(
                                  color: ResumeConstColor.headLineColor,
                                  fontSize: size.width * 0.040,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(resumeLocalDb.resumeEducation.toUpperCase(),
                                style: ResumeCustomTextStyle.poppins(
                                    color: Colors.black,
                                    fontSize: size.width * 0.040,
                                    fontWeight: FontWeight.w500))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Languages You speak >>",
                              style: ResumeCustomTextStyle.poppins(
                                  color: ResumeConstColor.headLineColor,
                                  fontSize: size.width * 0.040,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(resumeLocalDb.resumeLanguage.toUpperCase(),
                                style: ResumeCustomTextStyle.poppins(
                                    color: Colors.black,
                                    fontSize: size.width * 0.040,
                                    fontWeight: FontWeight.w500))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hobbies >>",
                              style: ResumeCustomTextStyle.poppins(
                                  color: ResumeConstColor.headLineColor,
                                  fontSize: size.width * 0.040,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(resumeLocalDb.resumeHobbies.toUpperCase(),
                                style: ResumeCustomTextStyle.poppins(
                                    color: Colors.black,
                                    fontSize: size.width * 0.040,
                                    fontWeight: FontWeight.w500))
                          ],
                        ),
                      ),
                      const ResumeBuildDivider(),
                    ],
                  ),
                )),
            Center(
              child: GeneratePdfButton(
                 onTap: () async {
                setState(() {
                  isShowLoading = true;
                });
                await _screenshotController.capture().then((image) {
                  // Capture Done
                  pdf_generate(screenshot: image!);
                }).catchError((error) {
                  log('error : $error');
                });
                setState(() {
                  isShowLoading = false;
                });
                customToastForProject(
                  msg:
                      'Resume download successfully\nPath : ReusmeBuilder',
                );
              },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: SubbmittingButton(
                onTap: () async {
                  await showDialog(
                      context: context,
                      builder: (context) {
                        return const DataDeleteDialogBox();
                      });
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
