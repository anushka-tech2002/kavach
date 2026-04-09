import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget commonTextField({
  required BuildContext context,
  required String hinttext,
  Key? fieldkey,
  EdgeInsets? padding,
  double? hintfontsize,
  double? radius,
  bool obscuretext = false,
  Icon? icon,
  Icon? sufficon,
  Color? iconcolour,
  Color? textcolour,
  Color? bordercolour,
  Color? textfieldcolour,
  Color? hinttextcolour,
  bool? iscolourfill,
  Image? imagepath,
  String? validator,
  onTap,
  String? suffixtext,
  onSuffixTap,
  bool? readonly,
  int? maxlength,
  String? ertext,
  ValueChanged<String>? onchange,
  List<TextInputFormatter>? inputFormatters,
  TextInputType keyboardType = TextInputType.text,
  required TextEditingController controller,
}) {
  return TextFormField(
      obscureText: obscuretext,
      style: TextStyle(color: Colors.white60),
      cursorColor: Colors.white60,
      decoration: InputDecoration(
          counterText: "",
          errorText: ertext,
          contentPadding: padding ?? EdgeInsets.all(10),
          hintText: hinttext,
          fillColor: textfieldcolour,
          filled: iscolourfill ?? false,
          hintStyle: TextStyle(fontSize: hintfontsize ?? 14.0, color: hinttextcolour ?? Colors.white60),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 12),
            borderSide: BorderSide(color: bordercolour ?? Colors.grey.shade300),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 12),
            borderSide: BorderSide(color: Colors.red, width: 1.2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 12.0),
            borderSide: BorderSide(color: Colors.red, width: 1.2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 12),
            borderSide: BorderSide(color: bordercolour ?? Colors.grey.shade400),
          ),
          prefixIcon: icon ?? imagepath,
          prefixIconColor: iconcolour ?? Colors.white60,
          suffixIcon: sufficon != null ? InkWell(onTap: onSuffixTap, child: sufficon) : null,
          suffixIconColor: iconcolour ?? Colors.white60,
          suffixText: suffixtext,
          suffixStyle: TextStyle(color: Colors.blueAccent)));
}

Widget commonbutton({
  required VoidCallback onpress,
  required String label,
  Color? buttonbg,
  Color? buttontxt,
  Color? borderColor,
  double? borderWidth,
  Color? shadowcolour,
  double? radius,
  EdgeInsets? padding,
  double? elevation,
}) {
  return FilledButton(
    style: FilledButton.styleFrom(
        backgroundColor: buttonbg ?? Colors.black,
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        side: BorderSide(
          color: borderColor ?? Colors.transparent,
          width: borderWidth ?? 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 15),
        ),
        elevation: elevation ?? 3,
        shadowColor: Colors.white),
    onPressed: onpress,
    child: Text(
      label,
      style: TextStyle(color: buttontxt ?? Colors.white, fontWeight: FontWeight.w500, fontFamily: "Mont"),
    ),
  );
}
