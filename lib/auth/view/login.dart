import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kawach/auth/view/forget_pass.dart';
import 'package:kawach/auth/view/register.dart';
import 'package:kawach/utils/common_widgets.dart';
import 'package:kawach/utils/global.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  double w = 0.0;
  double h = 0.0;
  bool obscureText = true;
  Icon finalicon = Icon(Icons.visibility_outlined);
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    w = ScreenSize.width(context);
    h = ScreenSize.height(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Full background
          Positioned.fill(
            child: Image.asset(
              AppImageData.loginbg,
              fit: BoxFit.cover,
            ),
          ),

          // Foreground content
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: h * 0.05),
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
                      Image.asset(
                        AppImageData.mainlogo,
                        height: 80,
                        width: 80,
                      ),
                      //SizedBox(height: h * 0.02),
                      Text(
                        "KAVACH",
                        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Color(0xFF42A5F5), shadows: [Shadow(color: Colors.white, blurRadius: 2)]),
                      ),
                      Text(
                        "STREE RAKSHA",
                        style: TextStyle(fontSize: 30, color: Color(0xFF42A5F5), fontWeight: FontWeight.bold, shadows: [Shadow(color: Colors.white, blurRadius: 2)]),
                      ),
                      SizedBox(height: h * 0.08),
                      Form(
                          key: key,
                          child: Column(
                            children: [
                              commonTextField(
                                  context: context,
                                  hinttext: "Email OR Phone",
                                  controller: _emailcontroller,
                                  bordercolour: Colors.blue,
                                  icon: Icon(FontAwesomeIcons.user),
                                  radius: 30,
                                  textfieldcolour: Colors.grey.shade800,
                                  hinttextcolour: Colors.white60,
                                  iconcolour: Colors.white60,
                                  iscolourfill: true),
                              SizedBox(
                                height: h * 0.04,
                              ),
                              commonTextField(
                                  context: context,
                                  hinttext: "Password",
                                  controller: _passwordcontroller,
                                  bordercolour: Colors.blue,
                                  icon: Icon(FontAwesomeIcons.lock),
                                  iconcolour: Colors.white60,
                                  hinttextcolour: Colors.white60,
                                  iscolourfill: true,
                                  obscuretext: obscureText,
                                  radius: 30,
                                  textfieldcolour: Colors.grey.shade800,
                                  onSuffixTap: () {
                                    setState(() {
                                      obscureText = !obscureText;
                                      print(obscureText);
                                      if (obscureText) {
                                        finalicon = Icon(Icons.visibility_outlined);
                                      } else {
                                        finalicon = Icon(Icons.visibility_off_outlined);
                                      }
                                    });
                                  },
                                  sufficon: finalicon),
                              SizedBox(
                                height: h * 0.10,
                              ),
                              SizedBox(width: double.infinity, child: commonbutton(onpress: () {}, label: "LOGIN", buttonbg: Color(0xFF42A5F5), radius: 30, borderColor: Colors.white)),
                              SizedBox(
                                height: h * 0.012,
                              ),
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    Get.to(() => ForgetPassScreen());
                                  },
                                  splashColor: Colors.blue.withOpacity(0.3), // ripple color
                                  highlightColor: Colors.yellow, // pressed color
                                  radius: 50, // optional rounded ripple
                                  child: Text(
                                    "Forgot Password?",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: h * 0.020),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Get.to(() => RegisterScreen());
                  },
                  splashColor: Colors.blue.withOpacity(0.3), // ripple color
                  highlightColor: Colors.transparent, // optional highlight
                  radius: 50,
                  child: RichText(
                    text: TextSpan(
                      text: "NEW TO KAVACH ? ",
                      style: TextStyle(color: Colors.grey, fontFamily: "Mont"),
                      children: [
                        TextSpan(
                          text: "SIGNUP",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );

    // TODO: implement build
    //throw UnimplementedError();
  }
}
