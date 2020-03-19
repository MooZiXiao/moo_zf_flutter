import 'package:fluttertoast/fluttertoast.dart';

class CommonToast {
  static ShowToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        // toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        // timeInSecForIos: 1,
        // fontSize: 16.0
    );
  }
}