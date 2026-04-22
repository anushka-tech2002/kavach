import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppImageData {
  static const splash_logo = "assets/images/onscreenposter.jpg";
  static const splash_logo1 = "assets/images/kavach1.jpg";
  static const logo = "assets/images/kavachamlogo.png";
  static const loginbg = "assets/images/loginbg.png";
  static const mainlogo = "assets/images/mainlogo.png";
  static const screenbg = "assets/images/screenbg.png";
}

class ScreenSize {
  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double blockWidth(BuildContext context) {
    return width(context) / 100;
  }

  static double blockHeight(BuildContext context) {
    return height(context) / 100;
  }
}

class Toast {
  static Future<void> toastMessage({required String text, Color? bgcolour}) {
    return Fluttertoast.showToast(msg: text, backgroundColor: bgcolour);
  }
}

class ScaffoldMessage {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> getScafoldMessage({required String text, required BuildContext context, Color? bgcolour}) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}
