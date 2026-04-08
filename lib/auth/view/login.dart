import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kawach/utils/common_widgets.dart';
import 'package:kawach/utils/global.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  double w = 0.0;
  double h = 0.0;
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    w = ScreenSize.width(context);
    h = ScreenSize.height(context);
    return Scaffold(
      body: Stack(
        children: [
          // Full background
          Positioned.fill(
            child: Image.asset(
              AppImageData.screenbg,
              fit: BoxFit.cover,
            ),
          ),

          // Foreground content
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: h * 0.10),
              child: Container(
                width: w * 0.85, // make it wide enough
                padding: EdgeInsets.all(w * 0.02),
                decoration: BoxDecoration(
                  color: Colors.transparent, // semi-transparent overlay
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Image.asset(
                    //   AppImageData.mainlogo,
                    //   height: 50,
                    //   width: 50,
                    // ),
                    SizedBox(height: h * 0.02),
                    Text(
                      "KAVACH",
                      style: TextStyle(fontSize: 40, fontFamily: "Inter", fontWeight: FontWeight.bold, color: Color(0xFF42A5F5), shadows: [Shadow(color: Colors.white, blurRadius: 2)]),
                    ),
                    Text(
                      "STREE RAKSHA",
                      style: TextStyle(fontSize: 35, fontFamily: "Inter", color: Color(0xFF42A5F5), fontWeight: FontWeight.bold, shadows: [Shadow(color: Colors.white, blurRadius: 2)]),
                    ),
                    SizedBox(height: h * 0.10),
                    Form(
                        child: Column(
                      children: [
                        commonTextField(
                            context: context,
                            hinttext: "Email OR Phone",
                            controller: _emailcontroller,
                            bordercolour: Colors.white60,
                            icon: Icon(FontAwesomeIcons.user),
                            textfieldcolour: Colors.white38,
                            hinttextcolour: Colors.white,
                            iconcolour: Colors.white,
                            iscolourfill: true),
                        SizedBox(
                          height: h * 0.05,
                        ),
                        commonTextField(
                            context: context,
                            hinttext: "Password",
                            controller: _passwordcontroller,
                            bordercolour: Colors.white60,
                            icon: Icon(FontAwesomeIcons.lock),
                            iconcolour: Colors.white,
                            hinttextcolour: Colors.white,
                            iscolourfill: true,
                            textfieldcolour: Colors.white38,
                            sufficon: Icon(FontAwesomeIcons.eye))
                      ],
                    ))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );

    // TODO: implement build
    //throw UnimplementedError();
  }
}
