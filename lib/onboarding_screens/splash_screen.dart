import 'package:flutter/material.dart';
import 'package:kawach/utils/global.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image(image: AssetImage(AppImageData.splash_logo)),
      ),
    );
    // TODO: implement build
    // throw UnimplementedError();
  }
}
