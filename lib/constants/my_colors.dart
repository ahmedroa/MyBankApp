import 'package:flutter/material.dart';

class MyColors {
  static const Color blue = Colors.grey;
  // static const Color blue = Color.fromARGB(255, 1, 80, 237);
  static const Color purple = Color.fromARGB(255, 116, 79, 152);
  static const Color bluee = Color(0xff0077c8);
  static const Color darkTheme = Color(0xff204056);
  static const Color lightBlue = Color(0xffE5EFFD);
  static const Color light = Color(0xfff6f6f5);
  static const Color green = Color(0xff0eb24e);
  static const Color lightGrey = Color(0xffE1E1E1);
  static const kTextColor = Color(0xFF29445d);
}

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (Route<dynamic> route) => false);

void tectFiled({
  required TextEditingController controller,
  required FocusNode focusNode,
  required var validator,
  required var function,
}) =>
    TextFormField(
        controller: controller,
        focusNode: focusNode,
        onEditingComplete: function,
        textInputAction: TextInputAction.next,
        validator: validator,
        decoration: const InputDecoration(
          labelText: 'Email',
          hintText: 'Enter your email!',
        ));
