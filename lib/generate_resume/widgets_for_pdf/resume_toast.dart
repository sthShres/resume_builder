import 'package:fluttertoast/fluttertoast.dart';
import 'package:rusume_builder/constants/colors.dart';



Future<bool?> customToastForProject({required String msg}) {
  return Fluttertoast.showToast(
    
    msg: msg,
    backgroundColor: ResumeConstColor.primary,
    fontSize: 15,

    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.SNACKBAR,
  );
}