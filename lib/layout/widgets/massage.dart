import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_bank/constants/my_colors.dart';

message({
  required String message,
  required Color color,
}) =>
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0,
    );

goBack(context) => Padding(
      padding: const EdgeInsets.all(12.0),
      child: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
          )),
    );

void showProgressIndicator(context) {
  showDialog(
    barrierColor: Colors.white.withOpacity(0),
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return const Center(
          child: CircularProgressIndicator(
        color: MyColors.purple,
      ));
    },
  );
}
