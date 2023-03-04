import 'package:flutter/material.dart';
import 'package:rusume_builder/constants/colors.dart';
import 'package:rusume_builder/home.dart';
import 'dart:developer';

import 'package:rusume_builder/local_db/resume_localdb.dart';

class DataDeleteDialogBox extends StatefulWidget {
  const DataDeleteDialogBox({
    Key? key,
  }) : super(key: key);

  @override
  State<DataDeleteDialogBox> createState() => _DataDeleteDialogBoxState();
}

class _DataDeleteDialogBoxState extends State<DataDeleteDialogBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 12,
      ),
      content: Container(
        height: 130,
        width: MediaQuery.of(context).size.width * 0.55,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.06),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.black.withOpacity(0.09),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Are You Sure ?',
              style: ResumeCustomTextStyle.poppins(
                color: ResumeConstColor.primary,
                fontWeight: FontWeight.w700,
                fontSize: 19,
              ),
            ),
            Divider(
              color: ResumeConstColor.primary.withOpacity(0.2),
              thickness: 1.5,
              endIndent: 10,
              indent: 10,
            ),
            const Spacer(flex: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    bool isDelete = await resumeLocalDb.deleteAllRecord();
                    log('IsDelete : $isDelete');
                    if (isDelete) {
                       Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      ResumeConstColor.primary,
                    ),
                  ),
                  child: Text(
                    'Yes',
                    style: ResumeCustomTextStyle.poppins(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      ResumeConstColor.primary,
                    ),
                  ),
                  child: Text(
                    'No',
                    style: ResumeCustomTextStyle.poppins(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ), 
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}

