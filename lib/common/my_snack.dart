import 'package:flutter/material.dart';

showmysnackbar({
  required BuildContext context,
required String message,
Color? color
}){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message),
    backgroundColor: color ?? Colors.green,
    duration: const Duration(seconds: 1)
      bhavior:SnackBarBehavior.floating ,)
  )}