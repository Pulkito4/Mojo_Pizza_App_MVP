import 'package:flutter/material.dart';

class CodeCopiedSnackBar {
  static SnackBar getSnackBar() {
    return SnackBar(
      content: const Center(child: Text('Code Copied!')),
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      backgroundColor: const Color.fromARGB(255, 142, 142, 142),
    );
  }
}
