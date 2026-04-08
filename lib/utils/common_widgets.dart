import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget commonTextField({
  required BuildContext context,
  required String hinttext,
  Key? fieldkey,
  EdgeInsets? padding,
  double? hintfontsize,
  double? radius,
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
  bool? readonly,
  int? maxlength,
  String? ertext,
  ValueChanged<String>? onchange,
  List<TextInputFormatter>? inputFormatters,
  TextInputType keyboardType = TextInputType.text,
  required TextEditingController controller,
}) {
  return TextFormField(
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
    suffixIcon: sufficon,
    suffixIconColor: iconcolour ?? Colors.white60,
  ));
}
