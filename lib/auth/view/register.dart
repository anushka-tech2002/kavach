import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kawach/utils/common_widgets.dart';
import 'package:kawach/utils/global.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  double w = 0.0;
  double h = 0.0;

  final GlobalKey<FormState> key = GlobalKey<FormState>();

  // Controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController parentMobileController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController streetController = TextEditingController();

  String selectedGender = "Female";
  String? selectedState;
  String? selectedCity;

  List<String> states = ["Maharashtra", "Gujarat", "Delhi"];
  List<String> cities = ["Nagpur", "Mumbai", "Pune"];

  @override
  Widget build(BuildContext context) {
    w = ScreenSize.width(context);
    h = ScreenSize.height(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Background
          Positioned.fill(
            child: Image.asset(
              AppImageData.screenbg,
              fit: BoxFit.cover,
            ),
          ),

          // Content
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: h * 0.03),
              child: Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.05),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Form(
                    key: key,
                    child: Column(
                      children: [
                        Image.asset(
                          AppImageData.mainlogo,
                          height: 80,
                          width: 80,
                        ),

                        Text(
                          "REGISTER",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF42A5F5),
                            shadows: [Shadow(color: Colors.white, blurRadius: 2)],
                          ),
                        ),

                        SizedBox(height: h * 0.03),

                        /// Name
                        commonTextField(
                            context: context,
                            hinttext: "Full Name",
                            controller: nameController,
                            icon: Icon(FontAwesomeIcons.user),
                            bordercolour: Colors.blue,
                            textfieldcolour: Colors.grey.shade800,
                            hinttextcolour: Colors.white60,
                            iconcolour: Colors.white60,
                            iscolourfill: true,
                            radius: 30,
                            suffixtext: "verify"),

                        SizedBox(height: h * 0.02),

                        /// Mobile
                        commonTextField(
                          context: context,
                          hinttext: "Mobile Number",
                          controller: mobileController,
                          icon: Icon(FontAwesomeIcons.phone),
                          bordercolour: Colors.blue,
                          textfieldcolour: Colors.grey.shade800,
                          hinttextcolour: Colors.white60,
                          iconcolour: Colors.white60,
                          iscolourfill: true,
                          radius: 30,
                        ),

                        SizedBox(height: h * 0.02),

                        /// Parent Mobile
                        commonTextField(
                          context: context,
                          hinttext: "Parent Mobile",
                          controller: parentMobileController,
                          icon: Icon(FontAwesomeIcons.phone),
                          bordercolour: Colors.blue,
                          textfieldcolour: Colors.grey.shade800,
                          hinttextcolour: Colors.white60,
                          iconcolour: Colors.white60,
                          iscolourfill: true,
                          radius: 30,
                        ),

                        SizedBox(height: h * 0.02),

                        /// Gender (Radio Buttons)
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Gender",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Row(
                          children: [
                            Radio(
                              value: "Female",
                              groupValue: selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  selectedGender = value!;
                                });
                              },
                            ),
                            Text("Female", style: TextStyle(color: Colors.white)),
                            Radio(
                              value: "Male",
                              groupValue: selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  selectedGender = value!;
                                });
                              },
                            ),
                            Text("Male", style: TextStyle(color: Colors.white)),
                          ],
                        ),

                        /// DOB
                        commonTextField(
                          context: context,
                          hinttext: "Date of Birth",
                          controller: dobController,
                          icon: Icon(Icons.calendar_today),
                          bordercolour: Colors.blue,
                          textfieldcolour: Colors.grey.shade800,
                          hinttextcolour: Colors.white60,
                          iconcolour: Colors.white60,
                          iscolourfill: true,
                          radius: 30,
                        ),

                        SizedBox(height: h * 0.02),

                        /// State + City (Side by Side)
                        Row(
                          children: [
                            Expanded(
                              child: DropdownButtonFormField(
                                value: selectedState,
                                dropdownColor: Colors.grey.shade900,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey.shade800,
                                  hintText: "State",
                                  hintStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                items: states
                                    .map((e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(e, style: TextStyle(color: Colors.white, fontSize: 14)),
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedState = value.toString();
                                  });
                                },
                              ),
                            ),
                            SizedBox(width: w * 0.02),
                            Expanded(
                              child: DropdownButtonFormField(
                                value: selectedCity,
                                dropdownColor: Colors.grey.shade900,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey.shade800,
                                  hintText: "City",
                                  hintStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                items: cities
                                    .map((e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(e, style: TextStyle(color: Colors.white, fontSize: 14)),
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedCity = value.toString();
                                  });
                                },
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: h * 0.02),

                        /// Pincode
                        commonTextField(
                          context: context,
                          hinttext: "Pincode",
                          controller: pincodeController,
                          icon: Icon(Icons.pin_drop),
                          bordercolour: Colors.blue,
                          textfieldcolour: Colors.grey.shade800,
                          hinttextcolour: Colors.white60,
                          iconcolour: Colors.white60,
                          iscolourfill: true,
                          radius: 30,
                        ),

                        SizedBox(height: h * 0.02),

                        /// Street
                        commonTextField(
                          context: context,
                          hinttext: "Street Address",
                          controller: streetController,
                          icon: Icon(Icons.home),
                          bordercolour: Colors.blue,
                          textfieldcolour: Colors.grey.shade800,
                          hinttextcolour: Colors.white60,
                          iconcolour: Colors.white60,
                          iscolourfill: true,
                          radius: 30,
                        ),

                        SizedBox(height: h * 0.05),

                        /// Register Button
                        SizedBox(
                          width: double.infinity,
                          child: commonbutton(
                            onpress: () {},
                            label: "REGISTER",
                            buttonbg: Color(0xFF42A5F5),
                            radius: 30,
                            borderColor: Colors.white,
                          ),
                        ),

                        SizedBox(height: h * 0.02),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
