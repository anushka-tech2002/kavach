import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kawach/auth/view/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "mahila kavach",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Mont"),
      builder: (context, child) {
        return SafeArea(
            child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: child!,
        ));
      },
      home: LoginScreen(),
    );
  }
}
