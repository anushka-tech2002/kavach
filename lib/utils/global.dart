import 'package:flutter/cupertino.dart';

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
