import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kawach/utils/global.dart';

import '../auth/view/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _animcontroller;
  late Animation<Offset> _animation;
  late Animation<double> _scaletransition;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(duration: Duration(seconds: 2), vsync: this);
    _animcontroller = AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = Tween<Offset>(begin: Offset(2, 0.0), end: Offset.zero).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceOut));
    _scaletransition = Tween<double>(begin: 0.5, end: 1.0).animate(CurvedAnimation(parent: _animcontroller, curve: Curves.elasticOut));
    _animcontroller.forward();
    _scaletransition.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(Duration(milliseconds: 400), () {
          _controller.forward();
        });
      }
    });
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(Duration(milliseconds: 600), () {
          _handlesession();
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _controller.dispose();
    _animcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = ScreenSize.width(context);
    double h = ScreenSize.height(context);
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            ScaleTransition(scale: _scaletransition, child: Image(image: AssetImage(AppImageData.splash_logo))),
            Positioned(top: h * 0.65, right: w * 0.25, child: SlideTransition(position: _animation, child: Image(image: AssetImage(AppImageData.logo))))
          ],
        )
        //Stack(child: Image(image: AssetImage(AppImageData.splash_logo))),
        );
    // TODO: implement build
    // throw UnimplementedError();
  }

  void _handlesession() {
    Get.off(() => LoginScreen());
  }
}
